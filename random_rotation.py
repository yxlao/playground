import numpy as np
from matplotlib import pyplot
from mpl_toolkits.mplot3d import Axes3D


def visualize(points):
    """
    points: n x 3
    """
    xs = points[:, 0]
    ys = points[:, 1]
    zs = points[:, 2]

    fig = pyplot.figure()
    ax = Axes3D(fig)

    ax.scatter(xs, ys, zs)
    pyplot.show()


if __name__ == '__main__':

    points = []
    for _ in range(1000):
        # https://math.stackexchange.com/a/1602779/209055
        q, r = np.linalg.qr(np.random.randn(3, 3))
        q[:, 0] = q[:, 0] * (1.0 if np.random.rand() < 0.5 else -1.0)
        q[:, 1] = np.linalg.det(q) * q[:, 1]
        point = q @ np.array([1, 0, 0])
        points.append(point)
    points = np.array(points)

    visualize(points)
