Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF020A366
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 18:53:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8A013C58C5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 18:53:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 702CB3C05A0
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 18:53:51 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ABDCE1A006FF
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 18:53:50 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGkiqS066238;
 Thu, 25 Jun 2020 16:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=TYllAfjTFtZPgOYBpQ5znU5d8xKr4Ba0tRwpKuSxbyo=;
 b=x5RVEscBzMl+5sG6of9ZCSpze08b5KckovKctpXRmbF4wMQis3UA5oMFXF0BIVuydppP
 auLS7PznyDhssolJjz+jQq0oDFS9VehoBdjbOqPTOt43BJhYt/V7zKASU32B73pqgkRW
 ufHS5mOH92cDgwBHwdw5b5Ybi7+0QfZMlGi/SMlps/V4q6lRLu1v+HJ0tea++bXABGq0
 /o4PkHWN004+2WuB1ivyJaWeBdHhpFYiUKTM7DsOhRPfuBbA8fhKiBNXocK2h2nevVfE
 vOu0Kc5t9kMF2ujIQoTxnUjlMqXfc6d9q5keJQbK1wZxOjUeoMeExu2onA/oQOyIxLq2 NQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 31uut5sn8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jun 2020 16:52:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGnQc7075048;
 Thu, 25 Jun 2020 16:52:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 31uurstw6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 16:52:37 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05PGqZMJ017073;
 Thu, 25 Jun 2020 16:52:36 GMT
Received: from [192.168.1.39] (/91.247.148.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 25 Jun 2020 16:52:35 +0000
To: Petr Vorel <petr.vorel@suse.com>, ltp@lists.linux.it
References: <20200622070911.16123-1-petr.vorel@suse.com>
 <20200622070911.16123-5-petr.vorel@suse.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <ddc1eb9d-af64-909e-bcc4-b7c7d5ddc7f1@oracle.com>
Date: Thu, 25 Jun 2020 19:52:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622070911.16123-5-petr.vorel@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 cotscore=-2147483648 priorityscore=1501
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006250105
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RESENT PATCH 4/5] net/test: Add basic testing for
 tst_rhost_run
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 22.06.2020 10:09, Petr Vorel wrote:
> From: Petr Vorel <pvorel@suse.cz>
> 
> Regression test for use of nested single quotes
> (fixed in previous commit).
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/newlib_tests/shell/net/tst_rhost_run.sh | 25 +++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100755 lib/newlib_tests/shell/net/tst_rhost_run.sh
> 
> diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> new file mode 100755
> index 000000000..4c034a4ac
> --- /dev/null
> +++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> +
> +TST_TESTFUNC=do_test
> +PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
> +. tst_net.sh
> +
> +do_test()
> +{
> +	local file="/etc/fstab"
> +
> +	tst_rhost_run -c 'which grep > /dev/null' || \
> +		tst_res TCONF "grep not found on rhost"
> +
> +	tst_rhost_run -c "[ -f $file ]" || \
> +		tst_res TCONF "$file not found on rhost"
> +
> +	tst_rhost_run -s -c "grep -q \"[^ ]\" $file"
> +	tst_rhost_run -s -c "grep -q '[^ ]' $file"
> +
> +	tst_res TPASS "tst_rhost_run is working"
> +}
> +
> +tst_run
> 

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
