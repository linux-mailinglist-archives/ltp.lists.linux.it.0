Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA8D2C56A3
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 15:05:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A2FF3C4E31
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 15:05:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 573613C4E1C
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 15:05:27 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6842C1400960
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 15:05:26 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AQE4v59115494;
 Thu, 26 Nov 2020 14:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2020-01-29;
 bh=adbNAVngJSHVDoTvMcOyg1g/9gMDuqg7ZB64Gro5sp4=;
 b=AFWpnior5auhy53ZzegcINq8Qn/rn7w+U2aTR4Y3YCN8Reij6eOeyCJ/p86lBkyf+smV
 5mS4Upf0xPoYyWZXm+ZW0zSttALWXi1iNz4mtArIeewOcwlaOJmcwYRU7BCSc9qXuoSc
 ra7ucnq0OljIr5/usNxrntfTD9JVXn1A3Wjqa60/NokY29esPzgvqFyUnCVb1KWHNUeG
 igktK7xOkRHdGLAqMofdXXQPSW7R7fbvkh4kLSxCs/EmHi1BYNR/lrocW2cpfxt4yYe3
 wph/CPlDq33eQ7K2Qz3/3cXy33mI8EEJE5OW/q0/vBILE3Hj4CzDNK3T7kdrNunUTlYs Tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 351kwhp7rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 26 Nov 2020 14:05:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AQE14mD159972;
 Thu, 26 Nov 2020 14:05:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 351kwg0guu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 14:05:18 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AQE5GmI021155;
 Thu, 26 Nov 2020 14:05:17 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Nov 2020 06:05:16 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: j.nixdorf@avm.de, LTP List <ltp@lists.linux.it>
References: <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
Message-ID: <edf96c93-8f16-6545-629a-be727d4c8eb2@oracle.com>
Date: Thu, 26 Nov 2020 17:05:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9816
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011260085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9816
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260084
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netstress: explicitly set a thread stack size
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

On 25.11.2020 16:06, Johannes Nixdorf via ltp wrote:
> Musl libc uses a relatively small thread stack size (128k [1]). This
> gets used up on 2 local buffers sized max_msg_len (64k by default),
> which causes a segfault due to a stack overflow in the error reporting
> path.
> 
> Set the stack size to 128kB + 2*max_msg_len instead, which is enough for
> both buffers with an additional allowance for the remaining stack usage
> by netstress and called libc or ltp helper functions.
> 
> [1]: https://urldefense.com/v3/__https://wiki.musl-libc.org/functional-differences-from-glibc.html*Thread_stack_size__;Iw!!GqivPVa7Brio!JiKwkv8uMgJNgh9ARntUpseI9zZW6h6u3Pm6AeF_sgqVyDcsHIQ_MyJWVVKbh_rVk-8u$ 
> 

Hi Johannes,

> +	errno = pthread_attr_init(&attr);
> +	if (errno != 0)

if (errno = pthread_attr_init(&attr))

> +		tst_brk(TBROK | TERRNO, "pthread_attr_init failed");
> +
> +	errno = pthread_attr_setstacksize(&attr, 128*1024 + 2*max_msg_len);

Since max_msg_len is 65535, the result won't be even 4 bytes aligned,
perhaps using just 256 * 1024?


> +	if (errno != 0)
> +		tst_brk(TBROK | TERRNO, "pthread_attr_setstacksize failed");

In case of error, it would be good to print the used stack size.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
