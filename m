Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92453EDA18
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 08:45:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5050D3C24DC
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 08:45:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 878053C2261
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 08:45:45 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id AA9D46009E3
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 08:45:44 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,266,1569254400"; d="scan'208,217";a="77882955"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 15:45:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 186624CE1511;
 Mon,  4 Nov 2019 15:37:38 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 4 Nov 2019 15:45:40 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Message-ID: <008a677b-644d-615f-6c4f-0961af928700@cn.fujitsu.com>
Date: Mon, 4 Nov 2019 15:45:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 186624CE1511.ABB9A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] question about the EPERM error of LTP bpf test
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
Content-Type: multipart/mixed; boundary="===============0994794546=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0994794546==
Content-Type: multipart/alternative;
	boundary="------------2A676A181C55D4D413729EA9"

--------------2A676A181C55D4D413729EA9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All

Now, I test bpf_prog02 and bpf_prog03 in my system(4.18.0-107.el8.x86_64).

#./bpf_prog03
tst_buffers.c:55: INFO: Test is using guarded buffers
tst_test.c:1137: INFO: Timeout per run is 0h 05m 00s
bpf_common.h:18: INFO: Raising RLIMIT_MEMLOCK to 262143
tst_capability.c:29: INFO: Dropping CAP_SYS_ADMIN(21)
bpf_common.h:37: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM (1)
#

Jan Stancek has added rlimit_bump_memlock function to avoid EPERM errno,
but I still can meet this problem every time even though I have increased BPF_MEMLOCK_ADD limit.

How can I run the two cases normally? Also, this error log(requires CAP_SYS_ADMIN on this system: EPERM
) makes me confused in this situation(because case drops CAP_SYS_ADMIN, but log reports need CAP_SYS_ADMIN)
and I think we may change it into "require CAP_SYS_ADMIN or max locked memory limit is too low".

Or, can I keep CAP_SYS_ADMIN cap in bpf_prog02/[3]?


Thanks
Yang Xu
  




--------------2A676A181C55D4D413729EA9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi All
</pre>
    <pre>Now, I test bpf_prog02 and bpf_prog03 in my system(4.18.0-107.el8.x86_64).

#./bpf_prog03
tst_buffers.c:55: INFO: Test is using guarded buffers
tst_test.c:1137: INFO: Timeout per run is 0h 05m 00s
bpf_common.h:18: INFO: Raising RLIMIT_MEMLOCK to 262143
tst_capability.c:29: INFO: Dropping CAP_SYS_ADMIN(21)
bpf_common.h:37: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM (1)
#

Jan Stancek has added rlimit_bump_memlock function to avoid EPERM errno, 
but I still can meet this problem every time even though I have increased BPF_MEMLOCK_ADD limit.

How can I run the two cases normally? Also, this error log(requires CAP_SYS_ADMIN on this system: EPERM
) makes me confused in this situation(because case drops CAP_SYS_ADMIN, but log reports need CAP_SYS_ADMIN)
and I think we may change it into "require CAP_SYS_ADMIN or max locked memory limit is too low".

Or, can I keep CAP_SYS_ADMIN cap in bpf_prog02/[3]?


Thanks
Yang Xu 
 
</pre>
  </body>
</html>

--------------2A676A181C55D4D413729EA9--

--===============0994794546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0994794546==--
