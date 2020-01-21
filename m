Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C01436D4
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 06:54:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7AA13C238C
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 06:54:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 73D723C0B90
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 06:54:21 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D2607200AD3
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 06:54:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,344,1574092800"; d="scan'208,217";a="82332404"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jan 2020 13:54:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 359E85010EA2;
 Tue, 21 Jan 2020 13:45:03 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 21 Jan 2020 13:54:12 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1575532537-27105-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200121052447.GA6657@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <5707ecce-aec4-a80d-5ec6-f9c728625634@cn.fujitsu.com>
Date: Tue, 21 Jan 2020 13:54:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200121052447.GA6657@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 359E85010EA2.AD7D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/userfaultfd01: Always require
 CAP_SYS_PTRACE
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
Content-Type: multipart/mixed; boundary="===============0198710944=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0198710944==
Content-Type: multipart/alternative;
	boundary="------------B6C1AFA612080335D9DEAC64"

--------------B6C1AFA612080335D9DEAC64
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter

> Hi Xu,
>
>> Since commit cefdca0a86be ("userfaultfd/sysctl: add vm.unprivileged_userfaultfd").
>> , it adds a global sysctl knob "vm.unprivileged_userfaultfd" to control whether
>> unprivileged users can use the userfaultfd system calls.  Set this to 1 to allow
>> unprivileged users to use the userfaultfd system calls, or set this to 0 to
>> restrict userfaultfd to only privileged users (with SYS_CAP_PTRACE capability).The
>> default value is 1. In order to use userfaultfd always, require CAP_SYS_PTRACE.
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Good idea, thanks!

We have pushed "syscalls/userfaultfd01: add hint about unprivileged_userfaultfd" patch(v2)[1].

This is v1.  li Wang and me both think adding hint is more wise, more info see[2].

[1] https://github.com/linux-test-project/ltp/commit/7dc571d3ad1908d6e50163a06ef848f096fe880a
[2] http://lists.linux.it/pipermail/ltp/2020-January/014921.html

Best Regards
Yang Xu

> Kind regards,
> Petr
>
>



--------------B6C1AFA612080335D9DEAC64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Peter
</pre>
    <blockquote type="cite" cite="mid:20200121052447.GA6657@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Xu,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Since commit cefdca0a86be ("userfaultfd/sysctl: add vm.unprivileged_userfaultfd").
, it adds a global sysctl knob "vm.unprivileged_userfaultfd" to control whether
unprivileged users can use the userfaultfd system calls.  Set this to 1 to allow
unprivileged users to use the userfaultfd system calls, or set this to 0 to
restrict userfaultfd to only privileged users (with SYS_CAP_PTRACE capability).The
default value is 1. In order to use userfaultfd always, require CAP_SYS_PTRACE.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Reviewed-by: Petr Vorel <a class="moz-txt-link-rfc2396E" href="mailto:pvorel@suse.cz">&lt;pvorel@suse.cz&gt;</a>
Good idea, thanks!
</pre>
    </blockquote>
    <pre>We have pushed "syscalls/userfaultfd01: add hint about unprivileged_userfaultfd" patch(v2)[1].</pre>
    <pre>This is v1.  li Wang and me both think adding hint is more wise, more info see[2]. </pre>
    <pre>[1] <a class="moz-txt-link-freetext" href="https://github.com/linux-test-project/ltp/commit/7dc571d3ad1908d6e50163a06ef848f096fe880a">https://github.com/linux-test-project/ltp/commit/7dc571d3ad1908d6e50163a06ef848f096fe880a</a>
[2] <a class="moz-txt-link-freetext" href="http://lists.linux.it/pipermail/ltp/2020-January/014921.html">http://lists.linux.it/pipermail/ltp/2020-January/014921.html</a>

Best Regards
Yang Xu
</pre>
    <blockquote type="cite" cite="mid:20200121052447.GA6657@dell5510">
      <pre class="moz-quote-pre" wrap="">
Kind regards,
Petr


</pre>
    </blockquote>
  </body>
</html>

--------------B6C1AFA612080335D9DEAC64--

--===============0198710944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0198710944==--
