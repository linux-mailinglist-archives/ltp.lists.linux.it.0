Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F16BEC30C
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 13:45:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D28E3C23F3
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 13:45:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2AD143C23EA
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 13:44:58 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 659D7100067C
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 13:44:53 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208,217";a="77795619"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 20:44:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 10E5741B7076;
 Fri,  1 Nov 2019 20:36:45 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 1 Nov 2019 20:44:45 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1571821231-3846-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191031143148.GA6781@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <dc5a87c6-512e-b9fc-66ca-987e9e88f9ae@cn.fujitsu.com>
Date: Fri, 1 Nov 2019 20:44:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191031143148.GA6781@dell5510>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 10E5741B7076.AAB97
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/6] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
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
Cc: jack@suse.cz, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0834191910=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0834191910==
Content-Type: multipart/alternative;
	boundary="------------003CAB16455742FF5ABC6A3D"

--------------003CAB16455742FF5ABC6A3D
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/10/31 22:31, Petr Vorel wrote:

> Hi Xu,
>
>> Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
>> same as Q_GETQUOTA, but it returns quota information for the next ID
>> greater than or equal to id that has a quota set.
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   include/lapi/quotactl.h                       | 23 ++---
>>   m4/ltp-quota.m4                               | 36 +-------
>>   .../kernel/syscalls/quotactl/quotactl01.c     | 86 ++++++++++++-------
>>   3 files changed, 67 insertions(+), 78 deletions(-)
>> diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
> ...
>>   #ifndef LAPI_QUOTACTL_H__
>>   # define LAPI_QUOTACTL_H__
>> +#include <linux/quota.h>
> I'd prefer to add autotools check for <linux/quota.h configure.ac
> (I guess we ignore include/config.h.default atm).
>
> But, more important, I'd prefer to include <sys/quota.h> here as well:
>
> #ifdef HAVE_LINUX_QUOTA_H
> # include <linux/quota.h>
> #else
> # include <sys/quota.h>
> #endif

Hi Petr

It still has problems that sys/quota.h has some struct defintion as struct dqblk ,struct dqinfo.
Also, now linux/quota.h doesn't have quotactl function declaration.

I think we can use HAVE_STRUCT_IF_NEXTDQBLK macro in lapi/quotactl.h to decide whether include <linux/quota.h> because
I add <linux/quota.h> for finding struct if_netxdqblk defintion.

  

ps: In my ltp fork, it passed.

[1]https://travis-ci.org/xuyang0410/ltp/builds/605963472?utm_medium=notification&utm_source=github_status

Thanks
Yang Xu

>
> => move it from quotactl0*.c (there is not yet agreement to include headers in
> lapi files, but later lapi files does it).
>
> The reason is that old distros fail when both headers are included at the same
> time (probably <linux/quota.h> got fixed later, maybe there is an workaround,
> but the easiest way is to handle this in header anyway).
>
> Kind regards,
> Petr
>
> [1] https://travis-ci.org/pevik/ltp/jobs/605507690
> [2] https://api.travis-ci.org/v3/job/605507690/log.txt
>
>



--------------003CAB16455742FF5ABC6A3D
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
      <pre>on 2019/10/31 22:31, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191031143148.GA6781@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Xu,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
same as Q_GETQUOTA, but it returns quota information for the next ID
greater than or equal to id that has a quota set.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
---
 include/lapi/quotactl.h                       | 23 ++---
 m4/ltp-quota.m4                               | 36 +-------
 .../kernel/syscalls/quotactl/quotactl01.c     | 86 ++++++++++++-------
 3 files changed, 67 insertions(+), 78 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">...
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #ifndef LAPI_QUOTACTL_H__
 # define LAPI_QUOTACTL_H__
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#include &lt;linux/quota.h&gt;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I'd prefer to add autotools check for &lt;linux/quota.h configure.ac
(I guess we ignore include/config.h.default atm).

But, more important, I'd prefer to include &lt;sys/quota.h&gt; here as well:

#ifdef HAVE_LINUX_QUOTA_H
# include &lt;linux/quota.h&gt;
#else
# include &lt;sys/quota.h&gt;
#endif</pre>
    </blockquote>
    <pre>Hi Petr

It still has problems that sys/quota.h has some struct defintion as struct dqblk ,struct dqinfo.
Also, now linux/quota.h doesn't have quotactl function declaration.

I think we can use HAVE_STRUCT_IF_NEXTDQBLK macro in lapi/quotactl.h to decide whether include &lt;linux/quota.h&gt; because
I add &lt;linux/quota.h&gt; for finding struct if_netxdqblk defintion.
<pre> </pre></pre>
    <pre>ps: In my ltp fork, it passed.</pre>
    <pre>[1]<a class="moz-txt-link-freetext" href="https://travis-ci.org/xuyang0410/ltp/builds/605963472?utm_medium=notification&amp;utm_source=github_status">https://travis-ci.org/xuyang0410/ltp/builds/605963472?utm_medium=notification&amp;utm_source=github_status</a>
</pre>
    <pre>Thanks
Yang Xu
</pre>
    <blockquote type="cite" cite="mid:20191031143148.GA6781@dell5510">
      <pre class="moz-quote-pre" wrap="">

=&gt; move it from quotactl0*.c (there is not yet agreement to include headers in
lapi files, but later lapi files does it).

The reason is that old distros fail when both headers are included at the same
time (probably &lt;linux/quota.h&gt; got fixed later, maybe there is an workaround,
but the easiest way is to handle this in header anyway).

Kind regards,
Petr

[1] <a class="moz-txt-link-freetext" href="https://travis-ci.org/pevik/ltp/jobs/605507690">https://travis-ci.org/pevik/ltp/jobs/605507690</a>
[2] <a class="moz-txt-link-freetext" href="https://api.travis-ci.org/v3/job/605507690/log.txt">https://api.travis-ci.org/v3/job/605507690/log.txt</a>


</pre>
    </blockquote>
  </body>
</html>

--------------003CAB16455742FF5ABC6A3D--

--===============0834191910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0834191910==--
