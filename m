Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB442C613D
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 09:57:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C9633C5DD9
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 09:57:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 102683C0041
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 09:57:08 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E357C200FD2
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 09:57:06 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AR8suRR099776;
 Fri, 27 Nov 2020 08:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=lKm7gieQyMQOQe9aOwvZGdTBUS1aoEOpfG4ROFXhsNo=;
 b=ObaPNIs1+RY2Yfj5y/8eL7Go5ADbTQlh8AIXhgntlp3g3o8fDcR7ahTwvOrQFEyocHkc
 TjiOiD+63Ma5LYx+q4+YNIgbAaaMWr1O8RHb6IqZ0zqlNW85QvGA6ZmEQJsROcbvdGeQ
 Ce0M/3+D8S0BkByQ/Vapa/EsKZXvvN6poceRQh7vqNz2pGzpM6VoBNT+QZy0aZ3OHj3G
 Q1t14R/XCy7Ni0Ft+yhk7g8XDXJ4klup2+tK5ww4YHiC9S8i997UOLjBpEq8efaiYjQO
 uFtfDztvVr8y9XJeMEfBMSVc5XrpeuQQusE2SIZpYVlOSPFwZV3f6PtCnEPoQn4S3U8m WQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 351kwhrf22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Nov 2020 08:56:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AR8j4Li059456;
 Fri, 27 Nov 2020 08:54:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 351kwh41jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 08:54:58 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AR8so6o011330;
 Fri, 27 Nov 2020 08:54:55 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 27 Nov 2020 00:54:49 -0800
To: j.nixdorf@avm.de, LTP List <ltp@lists.linux.it>
References: <edf96c93-8f16-6545-629a-be727d4c8eb2@oracle.com>
 <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
 <OF47EE0279.8BED1D35-ONC125862C.0051B56D-C125862C.0051B570@avm.de>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <9c761b66-89c6-9121-88bb-44e98b9a64cb@oracle.com>
Date: Fri, 27 Nov 2020 11:54:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <OF47EE0279.8BED1D35-ONC125862C.0051B56D-C125862C.0051B570@avm.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9817
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011270054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9817
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270055
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

On 26.11.2020 17:52, Johannes Nixdorf via ltp wrote:
> Hi Alexey,
> 
> On Thu, Nov 26, 2020 at 05:05:14PM +0300, Alexey Kodanev wrote:
>>> +		tst_brk(TBROK | TERRNO, "pthread_attr_init failed");
>>> +
>>> +	errno = pthread_attr_setstacksize(&attr, 128*1024 + 2*max_msg_len);
>>
>> Since max_msg_len is 65535, the result won't be even 4 bytes aligned,
>> perhaps using just 256 * 1024?
> 
> The function pthread_attr_setstacksize does not have any alignment
> requirements specified and only sets the minimum stack size. This means
> the libc is required to over-allocate and suitably align the stack to
> match platform requirements. Is this broken on any libraries the LTP
> project cares about?

It doesn't mean you should intentionally pass unaligned size.

And on it's man-page [1], in errors section, there is a note that it might
return EINVAL for some systems if the stack size not multiple of page size.

[1] https://man7.org/linux/man-pages/man3/pthread_attr_setstacksize.3.html

> 
> Note that this is different from pthread_attr_setstack, as there the
> memory region is provided by the caller and the libc can't change the
> alignment later on.
> 
> I'm reluctant to use a static value here as max_msg_len may be modified
> by command line arguments.

max_msg_len is const.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
