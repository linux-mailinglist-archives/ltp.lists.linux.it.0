Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE22F64B8
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 16:36:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C96E3C6A7B
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 16:36:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E42FE3C56D9
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 16:36:13 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A8C031400FB1
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 16:36:12 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFZToO024778;
 Thu, 14 Jan 2021 15:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=mb/67ZOoIhk14K+PMrwjnDJYy05kmD75Vry7bmR+kRY=;
 b=pWkBtXsRW4FJONfj4qmpEp6BuN1p6RIourS85zPw/H1FKx3SiwvG3QketJTZwWWb8TA5
 R7csclfR55M0AomWPSWkinWhdbzaMV8LbHX0yzSDnAdoHEzWG/HyPtRZL6riUO56ZcbQ
 r/V9fXgta7t5rEexJOBtqyN0rdxcDsS/TJrWIRFc6yKlSsPHX0/54QTt3vOou1x/VGpd
 RgvIiJ1qJHTqkSUUtPjrxIxpvLFJX8MKIpY1r9EcgzZIS/Xh8F8ZNSXelu5+58vvRoUx
 d8k7Pw0yppe4W0gGXSzlS8NZTD96xZzVDCRHOWde/LYxT9kXSdQ/bIGXe5JuBS01LYzN /w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 360kvk8qm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:36:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFa2ug096418;
 Thu, 14 Jan 2021 15:36:08 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 360kea2b15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:36:08 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10EFa5ZK007385;
 Thu, 14 Jan 2021 15:36:05 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 07:36:05 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210107120247.31465-1-pvorel@suse.cz>
 <d7eba485-08db-1cc7-abe6-38d23c244bfb@oracle.com> <X/7+vk6WsJ2LDJlC@pevik>
 <dced71df-28f6-056e-9518-338cccce4c11@oracle.com> <YABZkHIQmDUnKFZF@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <95ee938f-e045-4564-f6b2-952d54d2505b@oracle.com>
Date: Thu, 14 Jan 2021 18:36:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YABZkHIQmDUnKFZF@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140090
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Lower CHANGE_INTERVAL to 1
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

On 14.01.2021 17:47, Petr Vorel wrote:
> Hi Alexey,
> 
>> Hi Petr,
> 
>> Do you mean "sleep $NS_DURATION" in mcast-pktfld02.sh is not needed
> Yes: sleep $NS_DURATION in mcast-pktfld02.sh and other mcast*.sh tests in:
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/project/ltp/patch/20201125053459.3314021-2-lkml@jv-coder.de/__;!!GqivPVa7Brio!P0xbdqXlRQX7GPsKJmcPapdEOX5VV4OnkCKv-P9OqIWNcTvY9a9KXhOSjdJ1dKco5YbG$ 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/project/ltp/patch/20201125053459.3314021-1-lkml@jv-coder.de/__;!!GqivPVa7Brio!P0xbdqXlRQX7GPsKJmcPapdEOX5VV4OnkCKv-P9OqIWNcTvY9a9KXhOSjdJ1dKjzIVpO$ 
> 

It's needed because the commands run in parallel in the background
during $NS_DURATION. Without it, the test terminates them all shortly
after starting.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
