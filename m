Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B12757CE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 14:24:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE5743C59FE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 14:24:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 218BF3C29DC
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 14:24:01 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 7264910005FA
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 14:23:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,293,1596470400"; d="scan'208,217";a="99543199"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Sep 2020 20:23:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id B567848990D2;
 Wed, 23 Sep 2020 20:23:51 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 23 Sep 2020 20:23:49 +0800
Message-ID: <5F6B3E55.7020700@cn.fujitsu.com>
Date: Wed, 23 Sep 2020 20:23:49 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20200908073138.GB2475@yuki.lan> <20200922182102.GB12980@yuki.lan>
 <CAEemH2dFqYRNNSyhQ1bJ_L+wHFUQkOVBgdnm-_6Nqr4rP7UbBg@mail.gmail.com>
 <CAEemH2cxf2RQz5psmsaUsBHRrtayLJUVTfCo+NvevSyu7bLmvA@mail.gmail.com>
In-Reply-To: <CAEemH2cxf2RQz5psmsaUsBHRrtayLJUVTfCo+NvevSyu7bLmvA@mail.gmail.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B567848990D2.A93F4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Filip.Bozuta@syrmia.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0374988636=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0374988636==
Content-Type: multipart/alternative;
	boundary="------------060905050403070905050100"

--------------060905050403070905050100
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

于 2020/9/23 14:58, Li Wang 写道:
>
> CC' people who touched the patches maybe give a hand.
>
> On Wed, Sep 23, 2020 at 2:50 PM Li Wang <liwang@redhat.com 
> <mailto:liwang@redhat.com>> wrote:
>
>
>
>     On Wed, Sep 23, 2020 at 2:20 AM Cyril Hrubis <chrubis@suse.cz
>     <mailto:chrubis@suse.cz>> wrote:
>
>         Hi!
>         As far as I can tell I've pushed the last patch that should
>         have been in
>         the release just now. With that we should have a week worth of
>         pre-release testing since we are aiming for a release at the
>         end of the
>         September. If you haven't tried LTP git HEAD yet, please do so
>         now and
>         report any problems you find.
>
>
>     We still got this persistent fail on some kernels(RHEL8,
>     kernel-v5.9-rc4):
>
>     ---
>     send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>     send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>     send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>     send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>
>     ---
>     fanotify10.c:404: TFAIL: group 0 (4) got event: mask 1020
>     (expected 1000) pid=95067 fd=12
>     fanotify10.c:404: TFAIL: group 1 (4) got event: mask 1020
>     (expected 1000) pid=95067 fd=12
>     fanotify10.c:404: TFAIL: group 2 (4) got event: mask 1020
>     (expected 1000) pid=95067 fd=12
>     fanotify10.c:404: TFAIL: group 0 (0) got event: mask 1020
>     (expected 1000) pid=95067 fd=12
>     fanotify10.c:404: TFAIL: group 1 (0) got event: mask 1020
>     (expected 1000) pid=95067 fd=12
>     fanotify10.c:404: TFAIL: group 2 (0) got event: mask 1020
>     (expected 1000) pid=95067 fd=12
>
Hi Li,

I didn't reproduce the issue about fanotify10 on the lastest 
kernel(kernel-v5.9-rc6+):
-------------------------
[root@Fedora-30 fanotify]# ./fanotify10
tst_device.c:88: TINFO: Found free device 0 '/dev/loop0'
tst_mkfs.c:89: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.46-WIP (20-Mar-2020)
tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
fanotify10.c:452: TINFO: Test #0: ignore mount events created on a 
specific file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1981 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1981 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1981 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:452: TINFO: Test #1: ignore exec mount events created on a 
specific file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1983 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1983 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1983 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1983 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1983 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1983 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1983 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1983 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1983 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1983 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1983 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1983 
fd=4294967295
fanotify10.c:452: TINFO: Test #2: don't ignore mount events created on 
another file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1984 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1984 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1984 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1984 
fd=4294967295
fanotify10.c:452: TINFO: Test #3: don't ignore exec mount events created 
on another file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1985 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1985 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1985 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1985 
fd=4294967295
fanotify10.c:452: TINFO: Test #4: ignore inode events created on a 
specific mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1986 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1986 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1986 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_INODE and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:452: TINFO: Test #5: ignore exec inode events created on a 
specific mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1987 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1987 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1987 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1987 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1987 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1987 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1987 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1987 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1987 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1987 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1987 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1987 
fd=4294967295
fanotify10.c:452: TINFO: Test #6: don't ignore inode events created on 
another mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1988 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1988 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1988 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1988 
fd=4294967295
fanotify10.c:452: TINFO: Test #7: don't ignore exec inode events created 
on another mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1989 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1989 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1989 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1989 
fd=4294967295
fanotify10.c:452: TINFO: Test #8: ignore fs events created on a specific 
file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1990 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1990 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1990 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:452: TINFO: Test #9: ignore exec fs events created on a 
specific file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1991 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1991 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1991 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1991 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1991 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1991 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1991 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1991 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1991 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1991 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1991 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1991 
fd=4294967295
fanotify10.c:452: TINFO: Test #10: don't ignore mount events created on 
another file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1992 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1992 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1992 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1992 
fd=4294967295
fanotify10.c:452: TINFO: Test #11: don't ignore exec mount events 
created on another file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1993 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1993 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1993 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1993 
fd=4294967295
fanotify10.c:452: TINFO: Test #12: ignore fs events created on a 
specific mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1994 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1994 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1994 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_MOUNT ignore mask got no event
fanotify10.c:452: TINFO: Test #13: ignore exec fs events created on a 
specific mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1995 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1995 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1995 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1995 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1995 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1995 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1995 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1995 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1995 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1995 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1995 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1995 
fd=4294967295
fanotify10.c:452: TINFO: Test #14: don't ignore fs events created on 
another mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1996 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1996 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1996 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1996 
fd=4294967295
fanotify10.c:452: TINFO: Test #15: don't ignore exec fs events created 
on another mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1997 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1997 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1997 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1997 
fd=4294967295
fanotify10.c:452: TINFO: Test #16: ignore child exec events created on a 
specific mount point
fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1998 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1998 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1998 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1998 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1998 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1998 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1998 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1998 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1998 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1998 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1998 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1998 
fd=4294967295
fanotify10.c:452: TINFO: Test #17: ignore events on children of 
directory created on a specific file
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1999 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1999 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1999 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:452: TINFO: Test #18: ignore events on file created inside 
a parent watching children
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2000 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2000 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2000 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_INODE and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:452: TINFO: Test #19: don't ignore events on file created 
inside a parent not watching children
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=2001 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=2001 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=2001 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=2001 
fd=4294967295
fanotify10.c:452: TINFO: Test #20: ignore mount events created inside a 
parent watching children
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2002 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2002 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2002 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_MOUNT and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:452: TINFO: Test #21: don't ignore mount events created 
inside a parent not watching children
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=2003 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=2003 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=2003 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=2003 
fd=4294967295
fanotify10.c:452: TINFO: Test #22: ignore fs events created inside a 
parent watching children
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2004 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2004 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2004 fd=15
fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_FILESYSTEM and 
FAN_MARK_INODE ignore mask got no event
fanotify10.c:452: TINFO: Test #23: don't ignore fs events created inside 
a parent not watching children
fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=2005 fd=15
fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=2005 
fd=4294967295
fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=2005 
fd=4294967295
fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=2005 
fd=4294967295

Summary:
passed   288
failed   0
skipped  0
warnings 0
-------------------------
Is the issue fixed recently? :-)

Best Regards,
Xiao Yang
>
>
>     ---
>     recvmmsg01.c:86:9: error: request for member ‘type’ in something
>     not a structure or union
>       timeout.type = tv->ts_type;
>
>     Otherwise, the latest LTP test good from my side(RHEL8,
>     mainline-kernel).
>
>     -- 
>     Regards,
>     Li Wang
>
>
>
> -- 
> Regards,
> Li Wang
>
>
>




--------------060905050403070905050100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#ffffff" text="#000000">
    于 2020/9/23 14:58, Li Wang 写道:
    <blockquote
cite="mid:CAEemH2cxf2RQz5psmsaUsBHRrtayLJUVTfCo+NvevSyu7bLmvA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size: small;"><br>
          </div>
          <div class="gmail_default" style="font-size: small;">CC' people who
            touched the patches maybe give a hand.</div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Sep 23, 2020 at 2:50
            PM Li Wang &lt;<a moz-do-not-send="true"
              href="mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">
            <div dir="ltr">
              <div dir="ltr">
                <div style="font-size: small;"><br>
                </div>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Wed, Sep 23, 2020
                  at 2:20 AM Cyril Hrubis &lt;<a moz-do-not-send="true"
                    href="mailto:chrubis@suse.cz" target="_blank">chrubis@suse.cz</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin: 0px 0px
                  0px 0.8ex; border-left: 1px solid rgb(204, 204, 204);
                  padding-left: 1ex;">Hi!<br>
                  As far as I can tell I've pushed the last patch that
                  should have been in<br>
                  the release just now. With that we should have a week
                  worth of<br>
                  pre-release testing since we are aiming for a release
                  at the end of the<br>
                  September. If you haven't tried LTP git HEAD yet,
                  please do so now and<br>
                  report any problems you find.<br>
                </blockquote>
                <div><br>
                </div>
                <div style="font-size: small;">We still got this
                  persistent fail on some kernels(RHEL8,
                  kernel-v5.9-rc4):</div>
                <div><br>
                </div>
                <div>---</div>
                send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)<br>
                send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)<br>
                send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)<br>
                <div style="font-size: small;">send02.c:86: FAIL: recv()
                  error: EAGAIN/EWOULDBLOCK (11)</div>
                <div style="font-size: small;"><br>
                </div>
                <div style="font-size: small;">---</div>
                <div style="font-size: small;">fanotify10.c:404: TFAIL:
                  group 0 (4) got event: mask 1020 (expected 1000)
                  pid=95067 fd=12<br>
                  fanotify10.c:404: TFAIL: group 1 (4) got event: mask
                  1020 (expected 1000) pid=95067 fd=12<br>
                  fanotify10.c:404: TFAIL: group 2 (4) got event: mask
                  1020 (expected 1000) pid=95067 fd=12<br>
                  fanotify10.c:404: TFAIL: group 0 (0) got event: mask
                  1020 (expected 1000) pid=95067 fd=12<br>
                  fanotify10.c:404: TFAIL: group 1 (0) got event: mask
                  1020 (expected 1000) pid=95067 fd=12<br>
                  fanotify10.c:404: TFAIL: group 2 (0) got event: mask
                  1020 (expected 1000) pid=95067 fd=12<br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    Hi Li,<br>
    <br>
    I didn't reproduce the issue about fanotify10 on the lastest
    kernel(kernel-v5.9-rc6+):<br>
    -------------------------<br>
    [root@Fedora-30 fanotify]# ./fanotify10<br>
    tst_device.c:88: TINFO: Found free device 0 '/dev/loop0'<br>
    tst_mkfs.c:89: TINFO: Formatting /dev/loop0 with ext2 opts='' extra
    opts=''<br>
    mke2fs 1.46-WIP (20-Mar-2020)<br>
    tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s<br>
    fanotify10.c:452: TINFO: Test #0: ignore mount events created on a
    specific file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1981
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1981
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1981
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #1: ignore exec mount events created
    on a specific file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1983
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1983
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1983
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1983
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #2: don't ignore mount events created
    on another file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1984
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1984
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1984
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1984
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #3: don't ignore exec mount events
    created on another file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1985
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1985
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1985
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1985
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #4: ignore inode events created on a
    specific mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1986
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1986
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1986
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_INODE and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #5: ignore exec inode events created
    on a specific mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1987
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1987
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1987
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1987
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #6: don't ignore inode events created
    on another mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1988
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1988
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1988
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1988
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #7: don't ignore exec inode events
    created on another mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1989
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1989
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1989
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1989
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #8: ignore fs events created on a
    specific file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1990
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1990
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1990
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #9: ignore exec fs events created on a
    specific file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1991
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1991
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1991
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1991
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #10: don't ignore mount events created
    on another file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1992
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1992
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1992
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1992
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #11: don't ignore exec mount events
    created on another file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1993
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1993
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1993
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1993
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #12: ignore fs events created on a
    specific mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1994
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1994
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1994
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_MOUNT ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #13: ignore exec fs events created on
    a specific mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1995
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1995
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1995
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1995
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #14: don't ignore fs events created on
    another mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=1996
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=1996
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=1996
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=1996
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #15: don't ignore exec fs events
    created on another mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1020 pid=1997
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1020 pid=1997
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1020 pid=1997
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1020 pid=1997
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #16: ignore child exec events created
    on a specific mount point<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 1020 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 1020 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 1020 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 1000 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 1000 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 1000 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 1000 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 1000 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 1000 pid=1998
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 1000 pid=1998
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 1000 pid=1998
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 1000 pid=1998
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #17: ignore events on children of
    directory created on a specific file<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=1999
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=1999
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=1999
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #18: ignore events on file created
    inside a parent watching children<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2000
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2000
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2000
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_INODE and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #19: don't ignore events on file
    created inside a parent not watching children<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=2001
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=2001
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=2001
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=2001
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #20: ignore mount events created
    inside a parent watching children<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2002
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2002
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2002
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_MOUNT and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #21: don't ignore mount events created
    inside a parent not watching children<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=2003
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=2003
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=2003
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=2003
    fd=4294967295<br>
    fanotify10.c:452: TINFO: Test #22: ignore fs events created inside a
    parent watching children<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2004
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2004
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2004
    fd=15<br>
    fanotify10.c:523: TPASS: group 0 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (4) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (0) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 0 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 1 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:523: TPASS: group 2 (e00) with FAN_MARK_FILESYSTEM and
    FAN_MARK_INODE ignore mask got no event<br>
    fanotify10.c:452: TINFO: Test #23: don't ignore fs events created
    inside a parent not watching children<br>
    fanotify10.c:411: TPASS: group 0 (8) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (8) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (8) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (4) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (4) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (4) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (0) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 1 (0) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 2 (0) got event: mask 20 pid=2005
    fd=15<br>
    fanotify10.c:411: TPASS: group 0 (e00) got event: mask 20 pid=2005
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 1 (e00) got event: mask 20 pid=2005
    fd=4294967295<br>
    fanotify10.c:411: TPASS: group 2 (e00) got event: mask 20 pid=2005
    fd=4294967295<br>
    <br>
    Summary:<br>
    passed   288<br>
    failed   0<br>
    skipped  0<br>
    warnings 0<br>
    -------------------------<br>
    Is the issue fixed recently? <span class="moz-smiley-s1"><span> :-)
      </span></span><br>
    <br>
    Best Regards,<br>
    Xiao Yang<br>
    <blockquote
cite="mid:CAEemH2cxf2RQz5psmsaUsBHRrtayLJUVTfCo+NvevSyu7bLmvA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">
            <div dir="ltr">
              <div class="gmail_quote">
                <div style="font-size: small;"><br>
                </div>
                <div style="font-size: small;">---</div>
                <div style="font-size: small;">recvmmsg01.c:86:9: error:
                  request for member ‘type’ in something not a structure
                  or union<br>
                    timeout.type = tv-&gt;ts_type;<br>
                </div>
                <div style="font-size: small;"><br>
                </div>
                <div style="font-size: small;">Otherwise, the latest LTP
                  test good from my side(RHEL8, mainline-kernel).</div>
                <div style="font-size: small;"><br>
                </div>
              </div>
              -- <br>
              <div dir="ltr">
                <div dir="ltr">
                  <div>Regards,<br>
                  </div>
                  <div>Li Wang<br>
                  </div>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060905050403070905050100--

--===============0374988636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0374988636==--
