Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF6FFCCA
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 02:21:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EACF83C1D33
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 02:21:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AA9DE3C17C4
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 02:21:49 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id AF1171001890
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 02:21:46 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,318,1569254400"; d="scan'208,217";a="78634076"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Nov 2019 09:21:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 93B204CE1BE4;
 Mon, 18 Nov 2019 09:13:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 18 Nov 2019 09:21:52 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191107130543.GD22352@rei.lan>
 <1573214419-15435-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1573214419-15435-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115163517.GB25964@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <60d360f6-fa33-0e80-8349-26f49a7fd34e@cn.fujitsu.com>
Date: Mon, 18 Nov 2019 09:21:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191115163517.GB25964@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 93B204CE1BE4.AD4CA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/2] syscalls/prctl09: New timer sample test
 for PR_SET_TIMERSLACK
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
Content-Type: multipart/mixed; boundary="===============0822710739=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0822710739==
Content-Type: multipart/alternative;
	boundary="------------ACBDC12DD49B6F8CB2805C46"

--------------ACBDC12DD49B6F8CB2805C46
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/16 0:35, Cyril Hrubis wrote:

> Hi!
>> It also moves test setup function before timer setup function,
>> so we can get this set value.
> Can we please change the library code in a separate patch with
> appropripate description of the change?

Of course. I will put the library code change in a separate patch.

>
> Otherwise it looks good.
>



--------------ACBDC12DD49B6F8CB2805C46
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
      <pre>on 2019/11/16 0:35, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191115163517.GB25964@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">It also moves test setup function before timer setup function,
so we can get this set value.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can we please change the library code in a separate patch with
appropripate description of the change?</pre>
    </blockquote>
    <pre>Of course. I will put the library code change in a separate patch.</pre>
    <blockquote type="cite" cite="mid:20191115163517.GB25964@rei.lan">
      <pre class="moz-quote-pre" wrap="">

Otherwise it looks good.

</pre>
    </blockquote>
  </body>
</html>

--------------ACBDC12DD49B6F8CB2805C46--

--===============0822710739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0822710739==--
