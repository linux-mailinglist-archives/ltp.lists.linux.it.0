Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD4104E1E
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:38:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F98A3C1CA3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:38:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DBB813C0738
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:38:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 014796222FB
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:38:23 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208,217";a="78839987"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 16:38:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 46E0D4CE1C01;
 Thu, 21 Nov 2019 16:30:03 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 16:38:21 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
 <d1d72a63-fd3b-e670-4559-c0216176546c@cn.fujitsu.com>
 <20191121054507.GB59487@x230>
 <d346af6e-c037-7ac7-748a-a53c9b12046b@cn.fujitsu.com>
 <20191121083215.GC14920@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <ef158248-aab5-74fb-fc1a-5bf9fbfeda79@cn.fujitsu.com>
Date: Thu, 21 Nov 2019 16:38:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191121083215.GC14920@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 46E0D4CE1C01.ADC85
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0045837540=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0045837540==
Content-Type: multipart/alternative;
	boundary="------------09A4EF72CC30BFEB5251FBC5"

--------------09A4EF72CC30BFEB5251FBC5
Content-Type: text/plain; charset="iso-8859-2"; format=flowed
Content-Transfer-Encoding: 8bit

on 2019/11/21 16:32, Petr Vorel wrote:

> Hi Xu,
>
>> I see. Now, I think we should avoid to use <linux/types.h>   because on musl  libc doesn't have it.
> IMHO <linux/types.h> are always installed from kernel, not from libc
> (packaged result of make headers_install run from kernel sources).

Oh, you are right. For this case, using <linux/types.h> is right that we don't have situation such as fanotify .

>
>> Also ,If we use uint64_t, they still failed on 2.6.32-754.el6.x86_64 with undefined  . Or, we should use TST_ABI to define uint64_t them
> Hm, that what I said: using kernel headers is imho easier that using libc
> headers (fewer problems with compatibility).
> Anyway, I don't want to block this patchset.
> We can always merge it as it is and sort/fix this problem later.

Yes. kernel header is more eaiser that libc. Thanks.

>
> Kind regards,
> Petr
>
>



--------------09A4EF72CC30BFEB5251FBC5
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=ISO-8859-2">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/21 16:32, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191121083215.GC14920@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Xu,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I see. Now, I think we should avoid to use &lt;linux/types.h&gt;   because on musl  libc doesn't have it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">IMHO &lt;linux/types.h&gt; are always installed from kernel, not from libc
(packaged result of make headers_install run from kernel sources).</pre>
    </blockquote>
    <pre>Oh, you are right. For this case, using &lt;linux/types.h&gt; is right that we don't have situation such as fanotify .  </pre>
    <blockquote type="cite" cite="mid:20191121083215.GC14920@dell5510">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Also ,If we use uint64_t, they still failed on 2.6.32-754.el6.x86_64 with undefined  . Or, we should use TST_ABI to define uint64_t them
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Hm, that what I said: using kernel headers is imho easier that using libc
headers (fewer problems with compatibility).
Anyway, I don't want to block this patchset.
We can always merge it as it is and sort/fix this problem later.</pre>
    </blockquote>
    <pre>Yes. kernel header is more eaiser that libc. Thanks.</pre>
    <blockquote type="cite" cite="mid:20191121083215.GC14920@dell5510">
      <pre class="moz-quote-pre" wrap="">

Kind regards,
Petr


</pre>
    </blockquote>
  </body>
</html>

--------------09A4EF72CC30BFEB5251FBC5--

--===============0045837540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0045837540==--
