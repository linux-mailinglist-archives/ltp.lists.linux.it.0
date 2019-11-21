Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0B104AF6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 08:07:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AB383C1CBB
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 08:07:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E04E73C1C8B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 08:07:27 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 1FBF11000CE7
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 08:07:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208,217";a="78834789"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 15:07:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 850594CE1C86;
 Thu, 21 Nov 2019 14:59:04 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 15:07:22 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510> <20191120151610.GB28197@dell5510>
 <efb495a4-1071-68fd-d5a2-7597646228e1@cn.fujitsu.com>
 <20191121051022.GA59487@x230>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <46954cdf-042b-fffd-583d-b1494d7747dd@cn.fujitsu.com>
Date: Thu, 21 Nov 2019 15:07:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191121051022.GA59487@x230>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 850594CE1C86.AE127
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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
Content-Type: multipart/mixed; boundary="===============0514174092=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0514174092==
Content-Type: multipart/alternative;
	boundary="------------83B9D5CAF905614006C47883"

--------------83B9D5CAF905614006C47883
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/21 13:10, Petr Vorel wrote:

> Hi Xu,
>
>>> + general question: do we want always test against kernel headers or libc
>>> headers? Libc is often outdated, so mostly it'd be our fallback to be tested.
>>> Ideally both kernel and libc header should be tested, but that's not easily
>>> achievable.
>> IMHO, We often test libc and it usually includes kernel headers ie.
>> <sys/quota.h> <sys/prctl.h>. I perfet to check one except that glibc and
>> kernel they have themselves implementation . If the struct or variable is
>> not defined, we can define it in ltp lapi headers. Then we can avoid build
>> error and increase coverage(because kernel may implement it).
> Yep. I'm ok with using libc headers (increased coverage), but we need good
> checks anyway for other libc (at least for musl; bionic also like glibc uses
> internally kernel headers, uclibc-ng usually embeds kernel header parts and
> strives to be glibc compatible anyway).

Hi Petr

Yes. I check <sys/quota.h> and <sys/prctl.h> on musl libc[1] and they don't include linux header files.
So I think checking both kernel and libc headers on other libc(musl,bionic) is meaningful.

ps: If our travis-ci has a target with musl, I think it will be better. I don't know whether possible.

[1]http://git.musl-libc.org/cgit/musl/tree/include/sys/quota.h

Thanks
Yang Xu

>
> Kind regards,
> Petr
>
>



--------------83B9D5CAF905614006C47883
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
      <pre>on 2019/11/21 13:10, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191121051022.GA59487@x230">
      <pre class="moz-quote-pre" wrap="">Hi Xu,

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+ general question: do we want always test against kernel headers or libc
headers? Libc is often outdated, so mostly it'd be our fallback to be tested.
Ideally both kernel and libc header should be tested, but that's not easily
achievable.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">IMHO, We often test libc and it usually includes kernel headers ie.
&lt;sys/quota.h&gt; &lt;sys/prctl.h&gt;. I perfet to check one except that glibc and
kernel they have themselves implementation . If the struct or variable is
not defined, we can define it in ltp lapi headers. Then we can avoid build
error and increase coverage(because kernel may implement it).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yep. I'm ok with using libc headers (increased coverage), but we need good
checks anyway for other libc (at least for musl; bionic also like glibc uses
internally kernel headers, uclibc-ng usually embeds kernel header parts and
strives to be glibc compatible anyway).</pre>
    </blockquote>
    <pre>Hi Petr

Yes. I check &lt;sys/quota.h&gt; and &lt;sys/prctl.h&gt; on musl libc[1] and they don't include linux header files.
So I think checking both kernel and libc headers on other libc(musl,bionic) is meaningful. 

ps: If our travis-ci has a target with musl, I think it will be better. I don't know whether possible.

[1]<a class="moz-txt-link-freetext" href="http://git.musl-libc.org/cgit/musl/tree/include/sys/quota.h">http://git.musl-libc.org/cgit/musl/tree/include/sys/quota.h</a>

Thanks
Yang Xu
</pre>
    <blockquote type="cite" cite="mid:20191121051022.GA59487@x230">
      <pre class="moz-quote-pre" wrap="">

Kind regards,
Petr


</pre>
    </blockquote>
  </body>
</html>

--------------83B9D5CAF905614006C47883--

--===============0514174092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0514174092==--
