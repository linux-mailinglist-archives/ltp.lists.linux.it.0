Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39B106A09
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 11:31:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E8FE3C23DD
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 11:31:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A5CEF3C0151
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 11:31:18 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C0FDD1003A59
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 11:31:17 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAMAOVv9106462;
 Fri, 22 Nov 2019 10:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=4SjuknBYGhoMli30NZIY5bSLD/OIgM1jnuBJ8a2yXO8=;
 b=DkhWECO0AyHZ63Hyax3yU3DsL7JNInxe/NrqsIPQDJDEkAJtzgR/+O725jXcyXSnR/K8
 cevZ4bJ0ARYgPoELyk64gM10YS3cy9Q4yG1zkmIWywCtAQvr97DsiG1OzUnPN0nJFcYH
 vihgBQXritWvBLOVztf9JUe+ENk7kls4PAjY4kxgoXZK/UZ+9D8bXDHEkoS5AisKLa8W
 uqKlrQFdFkZ3iGktYxjwwR8z4u/ihKC1ZdlZYkUTjmPWxJAse6oxtCAt7Ez/kV8SvIPC
 9GgNLzWisM4gX96VHb0HERG72KAeKzLvzhtgG7gsQ9S6QMzb+2qZro4S5zwO/ZBR4nhy zw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2wa92q9rrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 10:31:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAMAObr7169886;
 Fri, 22 Nov 2019 10:31:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2wec28nqfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 10:31:13 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAMAV9SI026515;
 Fri, 22 Nov 2019 10:31:09 GMT
Received: from [192.168.1.49] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 22 Nov 2019 02:31:09 -0800
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20191122100508.21265-1-chrubis@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5c00ffaa-c639-52d9-6305-edc7790e1769@oracle.com>
Date: Fri, 22 Nov 2019 13:31:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191122100508.21265-1-chrubis@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911220093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911220093
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] [PATCH] network/sctp_big_chunk: Add linux git
 tag
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

Hi Cyril,
On 22.11.2019 13:05, Cyril Hrubis wrote:
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  testcases/network/sctp/sctp_big_chunk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/network/sctp/sctp_big_chunk.c b/testcases/network/sctp/sctp_big_chunk.c
> index 4ebdcb20f..ceb91c5b9 100644
> --- a/testcases/network/sctp/sctp_big_chunk.c
> +++ b/testcases/network/sctp/sctp_big_chunk.c
> @@ -182,5 +182,9 @@ static struct tst_test test = {
>  	.setup = setup,
>  	.forks_child = 1,
>  	.test_all = run,
> -	.options = options
> +	.options = options,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "07f2c7ab6f8d"},

And {"CVE", "2018-5803"}, will add to the tags.

> +		{}
> +	}
>  };
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
