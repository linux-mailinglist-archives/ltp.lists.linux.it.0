Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B414B39F6
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 14:07:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAFC63C20B4
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 14:07:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0C7CF3C0794
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 14:07:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D5EF2600696
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 14:07:24 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,512,1559491200"; d="scan'208,217";a="75524401"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 20:07:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id E93D74CDFCE9;
 Mon, 16 Sep 2019 20:07:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 16 Sep 2019 20:07:20 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1560250815-2308-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5D2D681D.1050909@cn.fujitsu.com> <5D440CAA.9080701@cn.fujitsu.com>
 <5D6CC86E.5020009@cn.fujitsu.com> <20190911133315.GA21378@rei.lan>
 <5b2b7314-5d0a-1bc6-11ff-7088171b86e6@cn.fujitsu.com>
 <20190912122948.GB7714@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7779df48-5b2e-4c4b-d5c8-081bb7fd3257@cn.fujitsu.com>
Date: Mon, 16 Sep 2019 20:07:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190912122948.GB7714@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E93D74CDFCE9.A1521
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cgroup_regression_test.sh: fix test_5 possible
 mount failure because of cgroup hierarchy
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0853061345=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0853061345==
Content-Type: multipart/alternative;
	boundary="------------BE5E745C9CC177AB6B3203CE"

--------------BE5E745C9CC177AB6B3203CE
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

on 2019/09/12 20:29, Cyril Hrubis wrote:

> Hi!
>>> I'm looking at the original reproducer at:
>>>
>>> https://lists.openvz.org/pipermail/devel/2009-January/016345.html
>>>
>>> And as far as I can tell the test_5() was never actually doing what it
>>> takes to reproduce the bug, as far as I can tell the test was bogus to
>>> begin with. The main point of the reproducer is that the cgroup is
>>> unmounted while there is task in the group, then remounted again. As we
>>> cannot unmount the cgroup these days I would just go for removing the
>>> test instead of applying band aid over the code.
>> Hi Cyril
>>
>> why we can't unmount the cgroup these days?
> It's a bit more complicated, you can't decide on which controllers to
> put into your hierarchy as it's mounted already (by a systemd). You can
> mount them exactly the way systemd mounts them (a few controllers are
> put into combined hierarchies but most of them are separated) but to a
> different mount point. Also once controller is in use in v2 it cannot be
> used by v1, which is going to be problem soon. As we are in transition
> period between v1 and v2 doing anything portable with cgroups is going
> to be nightmare.

Thanks. I understand it..

>
>>   From kernel commit 839ec545("cgroup: fix root_count when mount fails due to busy subsystem"),
>> it should be reproduced as the following step
>> 1)mount two subsystem(A and B) mntpoint
>> 2)mount one subsystem(A) mntpoint, it will get EBUSY error
>> 3)without kernel commit, kill this process and task is still in cgroup, kernel will call cgroup_kill_sb()
>> to decrement root_count, then kernel crashes.
>>
>> Is it right?
> This does not seem to match the original reproducer but it may be
> another way how to reproduce the bug. Also I'm not sure that this
> reproducer makes sense, since the code in kernel has been rewritten
> completely since the 2.6 days. Generally I would say that we may need
> completely new tests for cgroups, but I doubt that we should make much
> effort for the v1 anyways. In the v2 you get all controllers in an
> unified hierachy and you can't mount them in a different way.

Yes. cgroup v2 has only a single hierarchy, not promise to mount them in
a different way.

And test_5 is a very old regresstion test and kernel code has been rewritten completely since 2.6.
No user will use such old kernel code to test. I agree with you that we should remove this test_5.

>
> If the only point is to get EBUSY on mount, then have a process exit
> while in the cgroup we should as well simplify the test. There is no
> point in mounting the subsystems together in the first step, as a matter
> of fact on modern distributions the test just checks that the two
> subsystems are mounted already then attempts to mount them combined,
> which fails. Why can't we mount the two controllers seperatelly in the
> case that nothing is mounted as well.

It sounds reasonable, mount them seperatelly in the case should also be a right way to reproduce this bug.
But I run this test_5 and I nerver meet this crash on my machines with cgroup v1 (kernel with 2.6.32 3.10 and 4.18 kernel).
I think this test is too old that we shoud remove it.
  

>



--------------BE5E745C9CC177AB6B3203CE
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">
      <pre>on 2019/09/12 20:29, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20190912122948.GB7714@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I'm looking at the original reproducer at:

<a class="moz-txt-link-freetext" href="https://lists.openvz.org/pipermail/devel/2009-January/016345.html">https://lists.openvz.org/pipermail/devel/2009-January/016345.html</a>

And as far as I can tell the test_5() was never actually doing what it
takes to reproduce the bug, as far as I can tell the test was bogus to
begin with. The main point of the reproducer is that the cgroup is
unmounted while there is task in the group, then remounted again. As we
cannot unmount the cgroup these days I would just go for removing the
test instead of applying band aid over the code.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Cyril

why we can't unmount the cgroup these days?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's a bit more complicated, you can't decide on which controllers to
put into your hierarchy as it's mounted already (by a systemd). You can
mount them exactly the way systemd mounts them (a few controllers are
put into combined hierarchies but most of them are separated) but to a
different mount point. Also once controller is in use in v2 it cannot be
used by v1, which is going to be problem soon. As we are in transition
period between v1 and v2 doing anything portable with cgroups is going
to be nightmare.</pre>
    </blockquote>
    <pre>Thanks. I understand it..</pre>
    <blockquote type="cite" cite="mid:20190912122948.GB7714@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> From kernel commit 839ec545("cgroup: fix root_count when mount fails due to busy subsystem"),
it should be reproduced as the following step
1)mount two subsystem(A and B) mntpoint
2)mount one subsystem(A) mntpoint, it will get EBUSY error
3)without kernel commit, kill this process and task is still in cgroup, kernel will call cgroup_kill_sb()
to decrement root_count, then kernel crashes.

Is it right?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This does not seem to match the original reproducer but it may be
another way how to reproduce the bug. Also I'm not sure that this
reproducer makes sense, since the code in kernel has been rewritten
completely since the 2.6 days. Generally I would say that we may need
completely new tests for cgroups, but I doubt that we should make much
effort for the v1 anyways. In the v2 you get all controllers in an
unified hierachy and you can't mount them in a different way.</pre>
    </blockquote>
    <pre>Yes. cgroup v2 has only a single hierarchy, not promise to mount them in 
a different way.

And test_5 is a very old regresstion test and kernel code has been rewritten completely since 2.6.
No user will use such old kernel code to test. I agree with you that we should remove this test_5.
</pre>
    <blockquote type="cite" cite="mid:20190912122948.GB7714@rei.lan">
      <pre class="moz-quote-pre" wrap="">

If the only point is to get EBUSY on mount, then have a process exit
while in the cgroup we should as well simplify the test. There is no
point in mounting the subsystems together in the first step, as a matter
of fact on modern distributions the test just checks that the two
subsystems are mounted already then attempts to mount them combined,
which fails. Why can't we mount the two controllers seperatelly in the
case that nothing is mounted as well.</pre>
    </blockquote>
    <pre>It sounds reasonable, mount them seperatelly in the case should also be a right way to reproduce this bug.
But I run this test_5 and I nerver meet this crash on my machines with cgroup v1 (kernel with 2.6.32 3.10 and 4.18 kernel).
I think this test is too old that we shoud remove it. 
 </pre>
    <blockquote type="cite" cite="mid:20190912122948.GB7714@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------BE5E745C9CC177AB6B3203CE--

--===============0853061345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0853061345==--
