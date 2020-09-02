class Solution(object):

    def findmedian(self, lists):
        if not lists or len(lists) == 0:
            return []

        n = len(lists)
        if n % 2 == 0:
            a = self.partition(lists, n / 2, 0, n - 1)
            b = self.partition(lists, n / 2 - 1, 0, n - 1)
            mid = (lists[a] + lists[b]) / (2 * 1.0)
            return mid
        else:
            mid = self.partition(lists, n / 2, 0, n - 1)
            return lists[mid]

    def partition(self, lists, k, start, end):

        key = lists[start]
        left, right = start, end

        while left < right:
            while left < right and lists[right] > key:
                right = right - 1
            lists[left] = lists[right]

            while left < right and lists[left] < key:
                left = left + 1
            lists[right] = lists[left]

        lists[left] = key

        if left == k:
            return left
        elif left > k:
            return self.partition(lists, k, start, left - 1)
        else:
            return self.partition(lists, k, left + 1, end)

    def avgData(self,list):
        # coding:utf-8
        # 求数组元素的平均值
        b = len(list)
        sum = 0
        for i in list:
            sum = sum + i
        return sum/b

if __name__ == "__main__":
    sol = Solution()
    lists = [2, 5, 4, 9, 3, 6, 8, 7, 1]
    # lists = [1, 2]
    print(sol.avgData(lists))
    # data = sol.findmedian(lists)
    # print("中位数 = %s" % data)