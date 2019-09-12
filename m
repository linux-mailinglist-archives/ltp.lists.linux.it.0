Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC1B0915
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 09:00:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1AC73C2085
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 09:00:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4D2CD3C0067
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 09:00:39 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2146B60153C
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 09:00:39 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208,217";a="75346564"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 15:00:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 7CE434CDFAC5;
 Thu, 12 Sep 2019 15:00:18 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 12 Sep 2019 15:00:27 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1560250815-2308-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5D2D681D.1050909@cn.fujitsu.com> <5D440CAA.9080701@cn.fujitsu.com>
 <5D6CC86E.5020009@cn.fujitsu.com> <20190911133315.GA21378@rei.lan>
From: =?UTF-8?B?WHUsIFlhbmcv5b6QIOadqA==?= <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <5b2b7314-5d0a-1bc6-11ff-7088171b86e6@cn.fujitsu.com>
Date: Thu, 12 Sep 2019 15:00:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190911133315.GA21378@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 7CE434CDFAC5.AF663
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0668771277=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0668771277==
Content-Type: multipart/alternative;
	boundary="------------E41EC7B0F98AC7C7AB7746E2"

--------------E41EC7B0F98AC7C7AB7746E2
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/09/11 21:33, Cyril Hrubis wrote:

> Hi!
>> Have somebody noticed this patch? ping.:-)
> Sorry for the long delay.
>
> I'm looking at the original reproducer at:
>
> https://lists.openvz.org/pipermail/devel/2009-January/016345.html
>
> And as far as I can tell the test_5() was never actually doing what it
> takes to reproduce the bug, as far as I can tell the test was bogus to
> begin with. The main point of the reproducer is that the cgroup is
> unmounted while there is task in the group, then remounted again. As we
> cannot unmount the cgroup these days I would just go for removing the
> test instead of applying band aid over the code.

Hi Cyril

why we can't unmount the cgroup these days?

 From kernel commit 839ec545("cgroup: fix root_count when mount fails due to busy subsystem"),
it should be reproduced as the following step
1)mount two subsystem(A and B) mntpoint
2)mount one subsystem(A) mntpoint, it will get EBUSY error
3)without kernel commit, kill this process and task is still in cgroup, kernel will call cgroup_kill_sb()
to decrement root_count, then kernel crashes.

Is it right?

Thanks
Yang Xu




--------------E41EC7B0F98AC7C7AB7746E2
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/09/11 21:33, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20190911133315.GA21378@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Have somebody noticed this patch? ping.:-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry for the long delay.

I'm looking at the original reproducer at:

<a class="moz-txt-link-freetext" href="https://lists.openvz.org/pipermail/devel/2009-January/016345.html">https://lists.openvz.org/pipermail/devel/2009-January/016345.html</a>

And as far as I can tell the test_5() was never actually doing what it 
takes to reproduce the bug, as far as I can tell the test was bogus to
begin with. The main point of the reproducer is that the cgroup is
unmounted while there is task in the group, then remounted again. As we
cannot unmount the cgroup these days I would just go for removing the
test instead of applying band aid over the code.</pre>
    </blockquote>
    <pre>Hi Cyril</pre>
    <pre>why we can't unmount the cgroup these days?

From kernel commit 839ec545("cgroup: fix root_count when mount fails due to busy subsystem"),
it should be reproduced as the following step
1)mount two subsystem(A and B) mntpoint
2)mount one subsystem(A) mntpoint, it will get EBUSY error
3)without kernel commit, kill this process and task is still in cgroup, kernel will call cgroup_kill_sb()
to decrement root_count, then kernel crashes.

Is it right?
</pre>
    <pre class="moz-quote-pre" wrap="">
Thanks
Yang Xu

</pre>
    <blockquote type="cite" cite="mid:20190911133315.GA21378@rei.lan">
    </blockquote>
  </body>
</html>

--------------E41EC7B0F98AC7C7AB7746E2--

--===============0668771277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0668771277==--
