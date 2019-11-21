Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48F104CCB
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 08:46:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99FE23C1C8B
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 08:46:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A262B3C0E97
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 08:46:02 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id DEC642010F7
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 08:46:00 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208,217";a="78837616"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 15:45:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5872D4CE1646;
 Thu, 21 Nov 2019 15:37:37 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 15:45:55 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
 <d1d72a63-fd3b-e670-4559-c0216176546c@cn.fujitsu.com>
 <20191121054507.GB59487@x230>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d346af6e-c037-7ac7-748a-a53c9b12046b@cn.fujitsu.com>
Date: Thu, 21 Nov 2019 15:45:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191121054507.GB59487@x230>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5872D4CE1646.AD653
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
Content-Type: multipart/mixed; boundary="===============1118387228=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1118387228==
Content-Type: multipart/alternative;
	boundary="------------EA0D3B2EE9382E1B853792A6"

--------------EA0D3B2EE9382E1B853792A6
Content-Type: text/plain; charset="iso-8859-2"; format=flowed
Content-Transfer-Encoding: 8bit


on 2019/11/21 13:45, Petr Vorel wrote:

> Based on Jan's comment [1], maybe he meant it specifically for __kernel_fsid_t in
> fanotify.h, not as a general approach. __kernel_fsid_t is more complicated than
> uint64_t. That's why I'm asking whether there is a general approach we want to
> take.

Hi Petr

I see. Now, I think we should avoid to use <linux/types.h>   because on musl  libc doesn't have it.

Also ,If we use uint64_t, they still failed on 2.6.32-754.el6.x86_64 with undefined  . Or, we should use TST_ABI to define uint64_t them

on myself.

Thanks
Yang Xu




--------------EA0D3B2EE9382E1B853792A6
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=ISO-8859-2">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/21 13:45, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191121054507.GB59487@x230">
      <pre class="moz-quote-pre" wrap="">Based on Jan's comment [1], maybe he meant it specifically for __kernel_fsid_t in
fanotify.h, not as a general approach. __kernel_fsid_t is more complicated than
uint64_t. That's why I'm asking whether there is a general approach we want to
take.</pre>
    </blockquote>
    <pre>Hi Petr

I see. Now, I think we should avoid to use &lt;linux/types.h&gt;   because on musl  libc doesn't have it. 
</pre>
    <pre>Also ,If we use uint64_t, they still failed on 2.6.32-754.el6.x86_64 with undefined  . Or, we should use TST_ABI to define uint64_t them 
</pre>
    <pre>on myself.

Thanks
Yang Xu
</pre>
    <blockquote type="cite" cite="mid:20191121054507.GB59487@x230">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EA0D3B2EE9382E1B853792A6--

--===============1118387228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1118387228==--
