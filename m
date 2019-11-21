Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F3104961
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 04:38:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 100443C2386
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 04:38:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 112D93C074B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 04:37:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id AEDDC1417277
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 04:37:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208,217";a="78826010"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 11:37:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B2EC34CE14FF;
 Thu, 21 Nov 2019 11:29:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 11:37:47 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510> <20191120151610.GB28197@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <efb495a4-1071-68fd-d5a2-7597646228e1@cn.fujitsu.com>
Date: Thu, 21 Nov 2019 11:37:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191120151610.GB28197@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B2EC34CE14FF.A119B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============2136956157=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2136956157==
Content-Type: multipart/alternative;
	boundary="------------585F5BFE1989928CA52D6307"

--------------585F5BFE1989928CA52D6307
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/20 23:16, Petr Vorel wrote:

> Hi Jan, Cyril, Xu,
>
>>> +#ifdef HAVE_STRUCT_IF_NEXTDQBLK
>>> +# include <linux/quota.h>
>>> +#else
>>> +# ifdef HAVE_LINUX_TYPES_H
>>> +# include <linux/types.h>
>> @Jan, @Cyril: Do we want to generally avoid loading <linux/types.h> if not really needed?
>> __u64 can be uint64_t etc (as it's also visible in struct dqblk in <sys/quota.h>
>> in various libc headers).
>> We used this approach for /usr/include/linux/bpf.h and for fanotify fixes for
>> musl (testcases/kernel/syscalls/fanotify/fanotify.h).
>> So unless you're against this approach here I'll change it before merge
>> (and add this info to next version of library API writing guidelines patch
>> https://patchwork.ozlabs.org/patch/1166786/).
> + general question: do we want always test against kernel headers or libc
> headers? Libc is often outdated, so mostly it'd be our fallback to be tested.
> Ideally both kernel and libc header should be tested, but that's not easily
> achievable.

IMHO, We often test libc and it usually includes kernel headers ie. 
<sys/quota.h> <sys/prctl.h>. I perfet to check one except that glibc and 
kernel they have themselves implementation . If the struct or variable 
is not defined, we can define it in ltp lapi headers. Then we can avoid 
build error and increase coverage(because kernel may implement it).   

>
> Kind regards,
> Petr
>



--------------585F5BFE1989928CA52D6307
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/20 23:16, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191120151610.GB28197@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Jan, Cyril, Xu,

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+#ifdef HAVE_STRUCT_IF_NEXTDQBLK
+# include &lt;linux/quota.h&gt;
+#else
+# ifdef HAVE_LINUX_TYPES_H
+# include &lt;linux/types.h&gt;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">@Jan, @Cyril: Do we want to generally avoid loading &lt;linux/types.h&gt; if not really needed?
__u64 can be uint64_t etc (as it's also visible in struct dqblk in &lt;sys/quota.h&gt;
in various libc headers).
We used this approach for /usr/include/linux/bpf.h and for fanotify fixes for
musl (testcases/kernel/syscalls/fanotify/fanotify.h).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So unless you're against this approach here I'll change it before merge
(and add this info to next version of library API writing guidelines patch
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/patch/1166786/">https://patchwork.ozlabs.org/patch/1166786/</a>).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">+ general question: do we want always test against kernel headers or libc
headers? Libc is often outdated, so mostly it'd be our fallback to be tested.
Ideally both kernel and libc header should be tested, but that's not easily
achievable.</pre>
    </blockquote>
    <pre><span class="tlid-translation translation" lang="en"><span title="" class="">IMHO, We often test libc and it usually includes kernel headers ie. &lt;sys/quota.h&gt; 
&lt;sys/prctl.h&gt;. I perfet to check one except that glibc and kernel they have themselves implementation .

If the struct or variable is not defined, we can define it in ltp lapi headers. 
Then we can avoid build error and increase coverage(because kernel may implement it).
</span></span> </pre>
    <blockquote type="cite" cite="mid:20191120151610.GB28197@dell5510">
      <pre class="moz-quote-pre" wrap="">

Kind regards,
Petr

</pre>
    </blockquote>
  </body>
</html>

--------------585F5BFE1989928CA52D6307--

--===============2136956157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2136956157==--
