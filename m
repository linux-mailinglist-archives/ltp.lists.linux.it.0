Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E062D97A3
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 12:48:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E38323C5A92
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 12:48:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 232283C23F6
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 12:48:35 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8770E1000528
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 12:48:34 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBhxWA102531;
 Mon, 14 Dec 2020 11:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=hPl+8STNa2r7vasJr+wptOa26Vzg2f3w1M8rzL/giXg=;
 b=jH4WMjBgSyqGAQ/IFQLhUf86yFQOoWUyRixT39Id5e/8N34YHJMbEXIvwpy5soPUCYnx
 2KJIPk9iYbL4r90Xa81Oap0wV0hnrTqHH3Ctd3FPqPEg9MbJapX711m//xNbUEvjhQQK
 SrbH3sFqXYT7Iy95sp4SH0B1qV/Yhhr1ZkUqyPg8z6nfFropIVRNnRQ0SJ6lU/UDxRu/
 C42zjGB1xw+IA3uBV2VQDdlwJ7DmictSLrr++pG1voYiZYgNrl2DYEmIg7Yl0JMnig/G
 JpJg0EK8Itk61mPktYR5dyaBc3AIKixvxrHabAy4Dgd3AqQ4t2tqAqR6Ia6lmsklp6o8 gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntkvq2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 11:48:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBf7us181390;
 Mon, 14 Dec 2020 11:48:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7ekc9at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 11:48:32 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BEBmVVv009260;
 Mon, 14 Dec 2020 11:48:31 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Dec 2020 03:48:30 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20201208162440.14538-1-alexey.kodanev@oracle.com>
 <20201208162440.14538-2-alexey.kodanev@oracle.com> <X9Mz9gfrtg2/g+cv@pevik>
Message-ID: <727ee088-ade0-e9ac-84a9-873201ebec1d@oracle.com>
Date: Mon, 14 Dec 2020 14:48:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9Mz9gfrtg2/g+cv@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140083
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] network/ping02: use tst_ping() from the
 library
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11.12.2020 11:55, Petr Vorel wrote:
> Hi Alexey,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Petr, thanks for the review!

Applied.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
