Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEAAFA3C
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 12:22:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C04353C20BE
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 12:22:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 466A13C1481
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 12:22:46 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A8F0E1A01A62
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 12:22:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,492,1559491200"; d="scan'208,217";a="75302178"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Sep 2019 18:22:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id C07CF4CE030A;
 Wed, 11 Sep 2019 18:22:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 11 Sep 2019 18:22:39 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190802115046.GB27727@rei>
 <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190827092520.GA28859@dell5510> <20190827095858.GB28859@dell5510>
 <20190827101644.GA30582@rei>
From: =?UTF-8?B?WHUsIFlhbmcv5b6QIOadqA==?= <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <05330771-04f6-0fe4-f99d-eb55ff8b733c@cn.fujitsu.com>
Date: Wed, 11 Sep 2019 18:22:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190827101644.GA30582@rei>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C07CF4CE030A.A05EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/statx04: use stx_attributes_mask
 before test
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0860865379=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0860865379==
Content-Type: multipart/alternative;
	boundary="------------DB9B89F4050BC66D8201F5BB"

--------------DB9B89F4050BC66D8201F5BB
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/08/27 18:16, Cyril Hrubis wrote:

> Hi!
>> also Cyril noted on Github issue #557 [1]:
>> "However I'm not sure that we should do this since kernel devs declared this to be bug after all."
>>
>> So maybe we should wait before applying it.
>>
>> @Cyril: can you please post link to discussion in LKML?
> I've talked to Jan Kara in person while developing these tests, so there
> is no track of this discussion.
>
> I guess that the best we can do here is to:
>
> * Apply this patch, since the test should generally check only for flags
>    that are supported in the bitflag returned by the syscall
>
> * Add another test that checks that these bitflags are enabled for new
>    enough kernels for certain set of filesystems

Hi Cyril

Do you mean use getxattr to ensure bitflags are enable or a functions test?
I am confused.

Thanks
Yang Xu

>



--------------DB9B89F4050BC66D8201F5BB
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
      <pre>on 2019/08/27 18:16, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20190827101644.GA30582@rei">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">also Cyril noted on Github issue #557 [1]:
"However I'm not sure that we should do this since kernel devs declared this to be bug after all."

So maybe we should wait before applying it.

@Cyril: can you please post link to discussion in LKML?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I've talked to Jan Kara in person while developing these tests, so there
is no track of this discussion.

I guess that the best we can do here is to:

* Apply this patch, since the test should generally check only for flags
  that are supported in the bitflag returned by the syscall

* Add another test that checks that these bitflags are enabled for new
  enough kernels for certain set of filesystems</pre>
    </blockquote>
    <pre>Hi Cyril

Do you mean use getxattr to ensure bitflags are enable or a functions test?
I am confused.

Thanks
Yang Xu 
</pre>
    <blockquote type="cite" cite="mid:20190827101644.GA30582@rei">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------DB9B89F4050BC66D8201F5BB--

--===============0860865379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0860865379==--
