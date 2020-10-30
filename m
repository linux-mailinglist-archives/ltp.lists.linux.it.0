Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B262A0988
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 16:20:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CCA03C5563
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 16:20:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 20F753C3099
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 16:20:46 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1784C601AE2
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 16:20:44 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UFEsQQ129363;
 Fri, 30 Oct 2020 15:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=gyIOguGWBCYvtMuuU/trS656bU0skrUI3EPIwH/A+4s=;
 b=qRw6QUIVgv976Pygmbcpyw6SKXTayfvDGpbYTQc9eZsRfmrHhCKHOz/PgK4L90HL5obZ
 yEe9XsWdYlBf8WtGegG8X7PH8KstNFd1iEVyB1IMwulvums32g2hZo7ZpFKBZGrkOnuF
 EPznwXt5BJ4K8hKiDtaQKjJQWDVUNCHIssQdutp8QYDEU8cNSbEHgcpbyN/HYv86vEZe
 Gs9Wdd1+jxtCgXnggkfX8nyiGP9ugvj1H3wTksI3Za42MWwP7j1WFIu93PuQ7BM1stkE
 Cxq+eqA6n5fNDBjRylyQ0TbhfntGlIVoc8ZE3Y7NRSXvNoilaO7sCkQXSx0yA3BKqgFw gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 34dgm4fujx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Oct 2020 15:20:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UFGaIo044342;
 Fri, 30 Oct 2020 15:20:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 34cwur30bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 15:20:40 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09UFKbEv028039;
 Fri, 30 Oct 2020 15:20:39 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 30 Oct 2020 08:20:37 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-5-alexey.kodanev@oracle.com>
 <20201026085313.GF21306@dell5510>
Message-ID: <53c0da78-6069-8e2b-947a-d0f90537b5e3@oracle.com>
Date: Fri, 30 Oct 2020 18:20:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026085313.GF21306@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9790
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010300115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9790
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010300115
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] network/virt: add wireguard02: ipsec vs
 wireguard
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

On 26.10.2020 11:53, Petr Vorel wrote:
> Hi Alexey,
> 
>> Compare multi-threading performance with IPSec/vti.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 

Thank you for review Petr!

Applied.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
