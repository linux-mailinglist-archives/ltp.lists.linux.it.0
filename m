Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4E104EA7
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 10:01:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F5113C22C8
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 10:01:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1C6E43C22C8
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 10:01:37 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C990B209D5C
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 10:01:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208,217";a="78842281"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 17:01:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 865E04CE1CB8;
 Thu, 21 Nov 2019 16:53:15 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 17:01:33 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510> <20191120151610.GB28197@dell5510>
 <efb495a4-1071-68fd-d5a2-7597646228e1@cn.fujitsu.com>
 <20191121051022.GA59487@x230>
 <46954cdf-042b-fffd-583d-b1494d7747dd@cn.fujitsu.com>
 <20191121082118.GA14920@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <af8b09de-63e9-be0f-f891-8bc24502e084@cn.fujitsu.com>
Date: Thu, 21 Nov 2019 17:01:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191121082118.GA14920@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 865E04CE1CB8.AEC43
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1781819917=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1781819917==
Content-Type: multipart/alternative;
	boundary="------------52B180F894BD9C716A8651C1"

--------------52B180F894BD9C716A8651C1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


on 2019/11/21 16:21, Petr Vorel wrote:

> Hi Xu,
>
>> Yes. I check <sys/quota.h> and <sys/prctl.h> on musl libc[1] and they don't include linux header files.
>> So I think checking both kernel and libc headers on other libc(musl,bionic) is meaningful.
> But in single C file we decide only on one of these two.
> It's a similar problem as testing raw syscall or libc wrapper (which we already
> solved with .test_variants).
> NOTE: Bionic has generate it's headers from linux headers.

I see.

Thanks again for reminding Bionic like glibc uses linux headers.

>
>> ps: If our travis-ci has a target with musl, I think it will be better. I don't know whether possible.
> It's here. But it requires some more fixes (in a meantime files are deleted),
> so I'll post it once it's everything fixed
> https://github.com/pevik/ltp/commits/travis/musl
> https://travis-ci.org/pevik/ltp/builds/614575796
>
> There is also CI on LTP on all glibc/uclibc-ng/musl in Buildroot
> http://autobuild.buildroot.net/index.php?reason=ltp-testsuite-20190930
>
> + There are other CI based on yocto/openembedded on glibc/uclibc-ng/musl

It is so cool.  And I think I  can move your musl patches to my ltp fork, so that I can also test them on musl
when I contribute my patches to ltp.

ps: I also think we should not block this patchset.

>
>> [1]http://git.musl-libc.org/cgit/musl/tree/include/sys/quota.h
> Kind regards,
> Petr
>
>



--------------52B180F894BD9C716A8651C1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/21 16:21, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191121082118.GA14920@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Xu,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Yes. I check &lt;sys/quota.h&gt; and &lt;sys/prctl.h&gt; on musl libc[1] and they don't include linux header files.
So I think checking both kernel and libc headers on other libc(musl,bionic) is meaningful.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">But in single C file we decide only on one of these two.
It's a similar problem as testing raw syscall or libc wrapper (which we already
solved with .test_variants).
NOTE: Bionic has generate it's headers from linux headers.</pre>
    </blockquote>
    <pre>I see.  
</pre>
    <pre>Thanks again for reminding Bionic like glibc uses linux headers.
</pre>
    <blockquote type="cite" cite="mid:20191121082118.GA14920@dell5510">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">ps: If our travis-ci has a target with musl, I think it will be better. I don't know whether possible.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">It's here. But it requires some more fixes (in a meantime files are deleted),
so I'll post it once it's everything fixed
<a class="moz-txt-link-freetext" href="https://github.com/pevik/ltp/commits/travis/musl">https://github.com/pevik/ltp/commits/travis/musl</a>
<a class="moz-txt-link-freetext" href="https://travis-ci.org/pevik/ltp/builds/614575796">https://travis-ci.org/pevik/ltp/builds/614575796</a>

There is also CI on LTP on all glibc/uclibc-ng/musl in Buildroot
<a class="moz-txt-link-freetext" href="http://autobuild.buildroot.net/index.php?reason=ltp-testsuite-20190930">http://autobuild.buildroot.net/index.php?reason=ltp-testsuite-20190930</a>

+ There are other CI based on yocto/openembedded on glibc/uclibc-ng/musl</pre>
    </blockquote>
    <pre>It is so cool.  And I think I  can move your musl patches to my ltp fork, so that I can also test them on musl 
when I contribute my patches to ltp.

ps: I also think we should not block this patchset.
</pre>
    <blockquote type="cite" cite="mid:20191121082118.GA14920@dell5510">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">[1]<a class="moz-txt-link-freetext" href="http://git.musl-libc.org/cgit/musl/tree/include/sys/quota.h">http://git.musl-libc.org/cgit/musl/tree/include/sys/quota.h</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Kind regards,
Petr


</pre>
    </blockquote>
  </body>
</html>

--------------52B180F894BD9C716A8651C1--

--===============1781819917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1781819917==--
