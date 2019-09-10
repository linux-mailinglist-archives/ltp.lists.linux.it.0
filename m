Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E9FAE404
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 08:52:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 840033C2083
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 08:52:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D26083C14F0
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 08:52:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id EDF801A00E03
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 08:52:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,487,1559491200"; d="scan'208,217";a="75218456"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Sep 2019 14:52:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 2ADEF4CE032E;
 Tue, 10 Sep 2019 14:51:51 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 10 Sep 2019 14:51:57 +0800
To: Cyril Hrubis <chrubis@suse.cz>, <ltp@lists.linux.it>
References: <20190906130707.GA7515@rei.lan>
From: =?UTF-8?B?WHUsIFlhbmcv5b6QIOadqA==?= <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <6f8e731c-6e60-0752-2dfe-399494b517b7@cn.fujitsu.com>
Date: Tue, 10 Sep 2019 14:51:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190906130707.GA7515@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 2ADEF4CE032E.AF245
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Content-Type: multipart/mixed; boundary="===============1607644299=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1607644299==
Content-Type: multipart/alternative;
	boundary="------------374357176EF1856AF5F62624"

--------------374357176EF1856AF5F62624
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/09/06 21:07, Cyril Hrubis wrote:

> Hi!
> As usually we should start prepare for a release somewhere at the end of
> the September.
>
> I will try to review as much patches as possible next week, then I would
> like to start the pre-release testing. So if there is something that
> really should go in before the release let me know.

Hi Cyril

I think my patch[1][2] to fix statx04 and ueven03 should be merged before the release.
Also my patch[3] to fix cgroup case should be reviewed if you have free time.

[1]https://patchwork.ozlabs.org/patch/1149792
[2]https://patchwork.ozlabs.org/patch/1158763
[3]https://patchwork.ozlabs.org/patch/1113680

Thanks
Yang Xu

>
> I would personally like to get the eBPF tests in, it would be nice if
> anyone could ack the v5.
>



--------------374357176EF1856AF5F62624
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
      <pre>on 2019/09/06 21:07, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20190906130707.GA7515@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
As usually we should start prepare for a release somewhere at the end of
the September.

I will try to review as much patches as possible next week, then I would
like to start the pre-release testing. So if there is something that
really should go in before the release let me know.</pre>
    </blockquote>
    <pre>Hi Cyril</pre>
    <pre>I think my patch[1][2] to fix statx04 and ueven03 should be merged before the release.
Also my patch[3] to fix cgroup case should be reviewed if you have free time.

[1]<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/patch/1149792">https://patchwork.ozlabs.org/patch/1149792</a>
[2]<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/patch/1158763">https://patchwork.ozlabs.org/patch/1158763</a>
[3]<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/patch/1113680">https://patchwork.ozlabs.org/patch/1113680</a>

Thanks
Yang Xu 
</pre>
    <blockquote type="cite" cite="mid:20190906130707.GA7515@rei.lan">
      <pre class="moz-quote-pre" wrap="">

I would personally like to get the eBPF tests in, it would be nice if
anyone could ack the v5.

</pre>
    </blockquote>
  </body>
</html>

--------------374357176EF1856AF5F62624--

--===============1607644299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1607644299==--
