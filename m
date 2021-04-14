Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A735F619
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 16:24:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 959B33C70E5
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 16:24:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 059BE3C1B70
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 16:24:18 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B6AD31400E40
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 16:24:17 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EEJpkS157401;
 Wed, 14 Apr 2021 14:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=z3j/6FsPyAgfIKwhL7Kq6fL0c1iznQpDGP73o/R2pvo=;
 b=OR1RX3JD5kt/wo78xCP1WLMSC6pXQdavyegBMxDw/NHo2ojfHt6X1xk8F/I/M5DZy1m9
 Ilc/YrLaMi2x5fhshIMmZXAmny7icpURPwIIp1V4HGnvq8Y2mm81JG1b8KfuqQO/UwMI
 A63TXLH8n1Ei88KLUjB/vpQqV5eA2g2mv5rfyqtvPkpJktUQi2ofHqXmNR2FGTLRRxFa
 F3gjRnzCj7Aq4UCYFwpGULVOJIkU6+gKmKJUFH8gJ8+uv2BtN5gnbzb7MjY/L/EOhn3k
 Q4n7p7ML8yg7KCLCTBMa5vem6vO5iGNBeQAtuXc31+TWnVtUIqKIxJGpcK0zdFFPFqCn UA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 37u3erjmdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 14:24:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EEKPi9050345;
 Wed, 14 Apr 2021 14:24:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by userp3030.oracle.com with ESMTP id 37unxyfjjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 14:24:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X29/zC5EISuwCThBmJ/6po+dGRTc5R9f6DDzb6DbfLVwM1xYSrAO4Tb/Fzw8+DlQXedw/zJZ3w5VHokulldCW3zwm8RJ2JwonHXNVEXgPXhuVEJcyzvHJDvBLMlJctecc3UAxGD6Y/Nk7gcJF2DBxzJyRFPlHEyAMXXHz4NgrdQ7odSotKojv1btv4tEEm65iOxrRQ3RkUGux47L4lwWptKHM0SmdTTwcAiAQQull7D8o+NlmC4fFKr0ImMDg3PJPGG9ZyttrOlPAjIW4Im4tkMG5ecVRKBejrjSGuys9XHc0m45Zbf2bHl71WmjJwx4XXVeh7MIAf6l9EmT4yOB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3j/6FsPyAgfIKwhL7Kq6fL0c1iznQpDGP73o/R2pvo=;
 b=nKtb4Y4p2gtmMHminTqM+JF30nMyvaJQTrW0qu4nvxcaVm/lH0PDpYe3glDUuichNIXurXQTHBDXb1n2bm99Lhe8z5PsQAaBZ+B0Xp1636ju6S3G1jWVa44gUvZBlRToF5S0SAxqKYc+YOgZKdp/n6igIo3jF+Mu+Z9lwsynDlVytA0vBcYuPH6xGH/xjVjGMJsx/aN5gcJJekvqUzhID+R/7PnK9kDOEXXM53qaw1hbA27xEaGSilr2dMhNlbEG+9y7NCn8KIrcU5VvdtLy9tpBvuZLFSZn8F/IWxb7cQnd66bANUcA3LU4731aUqz3OiG5pgxOobRSTStwI4FOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3j/6FsPyAgfIKwhL7Kq6fL0c1iznQpDGP73o/R2pvo=;
 b=grGxv9K2uWYCaA4YwUQ9YW/cGq+VElzAjwk7KlQ4Q8hmgOWvfqSTo5BGUORcEso+2D5BSgvCMDOiKg3ZweqJR1niW3ygRgBCHQdPhQ1d0G1J4RNrrJLCR2Tz2gFeQASTSXgDyw6WNZKR4J6DAkZyAWaqcKuftUUQnbxBJviIuDQ=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by SJ0PR10MB4541.namprd10.prod.outlook.com (2603:10b6:a03:2db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 14:24:02 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.4042.018; Wed, 14 Apr 2021
 14:24:02 +0000
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Xie Ziyao <xieziyao@huawei.com>, ltp@lists.linux.it
References: <20210326031254.202606-1-xieziyao@huawei.com>
 <20210326031254.202606-2-xieziyao@huawei.com>
Message-ID: <27b5734d-64e8-b316-c165-0e6563dc669f@oracle.com>
Date: Wed, 14 Apr 2021 17:23:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210326031254.202606-2-xieziyao@huawei.com>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.40] (95.161.221.177) by
 FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Wed, 14 Apr 2021 14:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 930e0963-39a8-414c-6eec-08d8ff50f369
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4541:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4541F7852AF08BECADEC364BFD4E9@SJ0PR10MB4541.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:112;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6ValCKDxQMKGwAKbWAX6f3pUL1lZXAvJxF1aA+7fUVOe/xrwUmCW4KMNDxnwxfaCshAJItrCcSpdrKqSX2xtli4fJjW7RZe6DHTuIYrteLOhf8FGfHgMYkHzomWTyiSoXhrGyEcEhtu9/G5qhCnhc2SOMv1CO7Agx0Qwh5PuWfBrJ369kSGtqunTNL6MVa57BvcYx75e/KiFy6VUC8Z7+tI9i7AdcUY5+/Hgi7ATyCikq3foobGJR2bxFrk8rz8I90kKQt9b27L0enRfVNXga7wYJYFu1Z+kkSesRY2Df9Lkm50DIEoP1VJlDNqs6xotUJ23eb8MUiR4+5xg67Hupp9j4YBpwYKIRs/v+HA3/2VnR0Ze5rduUVWvSYlZqlmEoDPTWSZeHJdQVRGS2O35J7yJQLiJ7kvRdr57TxcYrBEpyOl0+8i2WMr4tUSjFOcgQww4kulgmzVxq53Thdu8xuVEk1qDE9Oj7rZ/6Ue3CV601QA3uicpdzvIBvPsIPNRkPvEDKtMg6bpULEES4/bpc/fOO0eTWIj1BIdtcDrw0223Qx0y+pNKS8Tx6d5Dyg5uf9BZ+jf9Sl7bcNEQpp4uznICj1FGjBs1X2/QVZ1TXOeMgVtVWBMbdu86rOh/jmwCWhnjtqcHCkkM4+NcSXjEXATC/eaEbyGRinmT3y4UdAPW/4I+pk6jJ4fZwnLJEA8T15L/WEFtpCvAS8O2GlUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(346002)(39860400002)(376002)(16576012)(86362001)(44832011)(186003)(2906002)(8936002)(16526019)(5660300002)(6666004)(66476007)(316002)(6486002)(53546011)(38100700002)(31696002)(36756003)(478600001)(2616005)(8676002)(83380400001)(956004)(31686004)(26005)(66946007)(66556008)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzRPaUtJNjI0NnZYaERjbmJRM2lRYitPZjVWRzhDNElvcmI0N2poMHZzWjFK?=
 =?utf-8?B?YlZHTTlxbkZyZTg4QmtRbTdlaE9US0pvemozWC91WWp3U0dvc0YzV2VTT2Zi?=
 =?utf-8?B?RWVuQ3FZOXF4OGpUdkVaaFplZ3VubUZFNUMwRVJ5bjlGaklJMVNjaVdvMk5l?=
 =?utf-8?B?dGxLL3lEZG9KYzJTOGdYVmkwalVjcGpZNWgydnZrNVE1aHhGM3gvY2NMSkFM?=
 =?utf-8?B?d3IvMFo0RGxJVVpYZEVRampyQzJod3VqMytra1EzcGRkYktOMzFNcW0zTVBu?=
 =?utf-8?B?ZXkvWCtBOHR4OUw0VGdqNGx3OFNoR0UzbmtUOG0xRTREeFBVK0NEaWsrVG5z?=
 =?utf-8?B?aFp5NFZ6MnV2dDVOY1dSR3NBeW10R01uRHBBK1IrK3hvUi9tK1M5d0RwbW1N?=
 =?utf-8?B?WHhIN2Foalh2NkNjUEFoejVscEEwSDRGMG53clg1Rmk1bFZDRTE3ZERzYTVR?=
 =?utf-8?B?UXYyTkJ5M3kraWlhMjF0UU9tSklvMEFUeGorMThKRzR6VUtTbXJSUVRZZ3NL?=
 =?utf-8?B?cm9hR3B2U2wwajVTQ1hjYkh5VnBIejFyTmxiamV1ZGRpQlNSdTAxaXZTeDlh?=
 =?utf-8?B?U2UvQUdGRSthOUFhS2FEWmhYZzJhLzY0dXNWZFNwS1lFUTRmcFl1MXRwSWhH?=
 =?utf-8?B?TnRFU0wveXRYNVQ5OGs5cldrNURSZzRRTTZuQlVqWUpPZHVqYTVnbWprN3pH?=
 =?utf-8?B?Y3htQk1JZEhsbXozS0plUHhIbW9sQ2dYRlE0ZGxLMVJYSHNneVh3QlFQaTZH?=
 =?utf-8?B?VENyd0xIdDR6Q0RoQUFGVit4ZS9aQVhwckpQcjJ6VTU3cUt2WWxSUUZTUUdn?=
 =?utf-8?B?OFZjOW5IVTByVlBORTF6azZJSWRpaG5hTmdNeUk4MXg5SFNya1ZWVERIb2NE?=
 =?utf-8?B?K3RKQ1pKMUcrWFhBQW83UDBEakhVQ05Bbm91bzU4aUEzUk5zTUY2ay82MlVL?=
 =?utf-8?B?QUI2emR4RGI0aFNZVXc5OEkzMGRUK2dHMjRPWXY2Q3czVmtNTTJpbG9QTFFl?=
 =?utf-8?B?b0gvVDFGajhTelVWS09UYng4Si9jMDhlUjVVR1FwWUtnWEJVdmdBdDhmNVVD?=
 =?utf-8?B?VGJwcVlldGpXTWVqT2xxUXZRdUFRL2UrU0RYSHBPcVJWNkpuUk0vNnA5ck5X?=
 =?utf-8?B?aXRObEQwcm1VdzA1cmtYTXlzWG9Cd1kvY1oybldJUWI1TUdBdUdxV0pOa3Zk?=
 =?utf-8?B?Um9qQVRrUmNFSGpZazdBOHArcTduWXB6MlVsMjNGR3Y5WXdBUk8yTnI0TkFr?=
 =?utf-8?B?QVpjZGlaNWp0MjVLcWZJM2licHAvYzlxTm9WU1ZpeVgvT1NZRnlWc2Nad3JO?=
 =?utf-8?B?MWo3TlNkaHduQ0pEWXFzbmppZEg0c2IrUUY2RG9HdGJKaW1KVHhyZG5mS3ZY?=
 =?utf-8?B?bWQrNzVkNjBxTmt0ZDFiWStoNkJZSS9pZDdNQlNkTjlTaVZiNEJzaWdrbjZq?=
 =?utf-8?B?M090cmsyM21EUzRsK2hleW1vTDRQTms2RGl5M3JoQWFhT1JrSVM3WDQxS1dr?=
 =?utf-8?B?Mm1VVlVMTFhGcUdEL3U3VTFWQjNQUUdnQjhXQnVFdW8xbU9NUmNvQlNGZkdI?=
 =?utf-8?B?dFVHdDNxWGpmejJXTG5CSlZkRUtsQk5jdTVEYllJMDh3RmQxbUdXY2tsUDBh?=
 =?utf-8?B?ZTlWZytmd3lRaENyVHV1Z1FmaFQxRjYwU1gxcnU3RjVpVWlOMUxOc0xBa2Uz?=
 =?utf-8?B?L3o1djJla0g5K21XUld2YWl2aVZ0c0J1akhHb1Rjb0FVdnlJaThhcVh4VXAr?=
 =?utf-8?Q?qDHMhmjsz+XYgOfBKGIJXBWPD9hweQOnclwCiLv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930e0963-39a8-414c-6eec-08d8ff50f369
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 14:24:02.0803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKa/gJvf6XTILYxunZ2oRvuHIRBSKO5wNNkOfmOOeLCvEtig0LWHGW7QGO15Ws+Dge4waDhuv5Aq0EoiFgpHDVehsXt2O+lnUKUM4q5pahY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4541
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140100
X-Proofpoint-ORIG-GUID: WLZaiMoGWXJmigWz9J50wm8pcTo-jAC_
X-Proofpoint-GUID: WLZaiMoGWXJmigWz9J50wm8pcTo-jAC_
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140100
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/chown: rewrite chown/chown03.c with
 the new api
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

On 26.03.2021 06:12, Xie Ziyao wrote:
> For this:
>   testcases/kernel/syscalls/chown/chown03.c
> 
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
> ---
>  testcases/kernel/syscalls/chown/chown03.c | 232 +++++++---------------
>  1 file changed, 73 insertions(+), 159 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/chown/chown03.c b/testcases/kernel/syscalls/chown/chown03.c
> index 2c7bcfe7d..dfab3691b 100644
> --- a/testcases/kernel/syscalls/chown/chown03.c
> +++ b/testcases/kernel/syscalls/chown/chown03.c
> @@ -1,72 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> + * Copyright (c) International Business Machines  Corp., 2001
>   *
> - *   Copyright (c) International Business Machines  Corp., 2001
> - *
> - *   This program is free software;  you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; either version 2 of the License, or
> - *   (at your option) any later version.
> - *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - *   the GNU General Public License for more details.
> - *
> - *   You should have received a copy of the GNU General Public License
> - *   along with this program;  if not, write to the Free Software
> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + * 07/2001 Ported by Wayne Boyer
>   */
> 
> -/*
> - * Test Name: chown03
> - *
> - * Test Description:
> - *  Verify that, chown(2) succeeds to change the group of a file specified
> - *  by path when called by non-root user with the following constraints,
> - *	- euid of the process is equal to the owner of the file.
> - *	- the intended gid is either egid, or one of the supplementary gids
> - *	  of the process.
> - *  Also, verify that chown() clears the setuid/setgid bits set on the file.
> - *
> - * Expected Result:
> - *  chown(2) should return 0 and the ownership set on the file should match
> - *  the numeric values contained in owner and group respectively.
> - *
> - * Algorithm:
> - *  Setup:
> - *   Setup signal handling.
> - *   Create temporary directory.
> - *   Pause for SIGUSR1 if option specified.
> - *
> - *  Test:
> - *   Loop if the proper options are given.
> - *   Execute system call
> - *   Check return code, if system call failed (return=-1)
> - *	Log the errno and Issue a FAIL message.
> - *   Otherwise,
> - *	Verify the Functionality of system call
> - *      if successful,
> - *		Issue Functionality-Pass message.
> - *      Otherwise,
> - *		Issue Functionality-Fail message.
> - *  Cleanup:
> - *   Print errno log and/or timing stats if options given
> - *   Delete the temporary directory created.
> - *
> - * Usage:  <for command-line>
> - *  chown03 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -f   : Turn off functionality Testing.
> - *	       -i n : Execute test n times.
> - *	       -I x : Execute test for x seconds.
> - *	       -P x : Pause for x seconds between iterations.
> - *	       -t   : Turn on syscall timing.
> +/*\
> + * [Description]
>   *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> + * Verify that, chown(2) succeeds to change the group of a file specified
> + * by path when called by non-root user with the following constraints,
> + * - euid of the process is equal to the owner of the file.
> + * - the intended gid is either egid, or one of the supplementary gids
> + *   of the process.
> + * Also, verify that chown() clears the setuid/setgid bits set on the file.
>   *
> - * RESTRICTIONS:
> + * [Algorithm]
>   *
> + * - Execute system call
> + * - Check return code, if system call failed (return=-1)
> + * -   Log the errno and Issue a FAIL message
> + * - Otherwise
> + * -   Verify the Functionality of system call
> + * -   if successful
> + * -     Issue Functionality-Pass message
> + * -   Otherwise
> + * -     Issue Functionality-Fail message
>   */
> 
>  #include <stdio.h>
> @@ -80,123 +39,78 @@
>  #include <grp.h>
>  #include <pwd.h>
> 
> -#include "test.h"
> -#include "safe_macros.h"
> -#include "compat_16.h"
> +#include "tst_test.h"
> +#include "compat_tst_16.h"
> 
>  #define FILE_MODE	(S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
>  #define NEW_PERMS	(S_IFREG|S_IRWXU|S_IRWXG|S_ISUID|S_ISGID)
>  #define TESTFILE	"testfile"
> 
> -TCID_DEFINE(chown03);
> -int TST_TOTAL = 1;		/* Total number of test conditions */
> -char nobody_uid[] = "nobody";
> -struct passwd *ltpuser;
> -
> -void setup();			/* setup function for the test */
> -void cleanup();			/* cleanup function for the test */
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
>  	struct stat stat_buf;	/* stat(2) struct contents */
> -	int lc;
>  	uid_t user_id;		/* Owner id of the test file. */
>  	gid_t group_id;		/* Group id of the test file. */

I don't think these comments are helpful.

> 
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		UID16_CHECK((user_id = geteuid()), "chown", cleanup)
> -		GID16_CHECK((group_id = getegid()), "chown", cleanup)
> -
> -		TEST(CHOWN(cleanup, TESTFILE, -1, group_id));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "chown(%s, ..) failed",
> -				 TESTFILE);
> -			continue;
> -		}
> -
> -		if (stat(TESTFILE, &stat_buf) == -1)
> -			tst_brkm(TFAIL | TERRNO, cleanup,
> -				 "stat failed");
> -
> -		if (stat_buf.st_uid != user_id ||
> -		    stat_buf.st_gid != group_id)
> -			tst_resm(TFAIL, "%s: Incorrect ownership"
> -				 "set to %d %d, Expected %d %d",
> -				 TESTFILE, stat_buf.st_uid,
> -				 stat_buf.st_gid, user_id, group_id);
> -
> -		if (stat_buf.st_mode !=
> -		    (NEW_PERMS & ~(S_ISUID | S_ISGID)))
> -			tst_resm(TFAIL, "%s: incorrect mode permissions"
> -				 " %#o, Expected %#o", TESTFILE,
> -				 stat_buf.st_mode,
> -				 NEW_PERMS & ~(S_ISUID | S_ISGID));
> -		else
> -			tst_resm(TPASS, "chown(%s, ..) was successful",
> -				 TESTFILE);
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	UID16_CHECK((user_id = geteuid()), "chown");
> +	GID16_CHECK((group_id = getegid()), "chown");
> +
> +	TEST(CHOWN(TESTFILE, -1, group_id));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "chown(%s, ..) failed",
> +			TESTFILE);

It could be replaced with TST_EXP_PASS() macro (+ TPASS message below).

> +
> +	SAFE_STAT(TESTFILE, &stat_buf);
> +
> +	if (stat_buf.st_uid != user_id || stat_buf.st_gid != group_id)
> +		tst_res(TFAIL, "%s: Incorrect ownership"
> +			       "set to %d %d, Expected %d %d",
> +			TESTFILE, stat_buf.st_uid,
> +			stat_buf.st_gid, user_id, group_id);
> +
> +	if (stat_buf.st_mode != (NEW_PERMS & ~(S_ISUID | S_ISGID)))
> +		tst_res(TFAIL, "%s: incorrect mode permissions"
> +			       " %#o, Expected %#o", TESTFILE,
> +			stat_buf.st_mode,
> +			NEW_PERMS & ~(S_ISUID | S_ISGID));
> +	else
> +		tst_res(TPASS, "chown(%s, ..) was successful",
> +			TESTFILE);
>  }
> 
> -/*
> - * void
> - * setup() - performs all ONE TIME setup for this test.
> - *  Create a temporary directory and change directory to it.
> - *  Create a test file under temporary directory and close it
> - *  Change the group ownership on testfile.
> - */
> -void setup(void)
> +static void setup(void)
>  {
> -	int fd;			/* file handler for testfile */
> -
> -	TEST_PAUSE;
> -
> -	tst_require_root();
> +	int fd;		/* file handler for testfile */
                            ^
Also, this comment is not really needed here.

> +	struct passwd *ltpuser;
> 
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	tst_tmpdir();
> -
> -	ltpuser = getpwnam(nobody_uid);
> +	ltpuser = SAFE_GETPWNAM("nobody");
>  	if (ltpuser == NULL)
> -		tst_brkm(TBROK | TERRNO, NULL, "getpwnam(\"nobody\") failed");
> -	SAFE_SETEGID(NULL, ltpuser->pw_gid);
> -	SAFE_SETEUID(NULL, ltpuser->pw_uid);
> +		tst_brk(TBROK | TTERRNO,
> +			"getpwnam(\"nobody\") failed");

SAFE_GETPWNAM() would have already call tst_brk() if getpwnam()
had returned null.

> +	SAFE_SETEGID(ltpuser->pw_gid);
> +	SAFE_SETEUID(ltpuser->pw_uid);
> 
>  	/* Create a test file under temporary directory */
> -	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1)
> -		tst_brkm(TBROK | TERRNO, cleanup,
> -			 "open(%s, O_RDWR|O_CREAT, %o) failed", TESTFILE,
> -			 FILE_MODE);
> -
> -	SAFE_SETEUID(cleanup, 0);
> -
> -	SAFE_FCHOWN(cleanup, fd, -1, 0);
> +	fd = SAFE_OPEN(TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
> 
> -	SAFE_FCHMOD(cleanup, fd, NEW_PERMS);
> -
> -	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
> -
> -	SAFE_CLOSE(cleanup, fd);
> +	SAFE_SETEUID(0);
> +	SAFE_FCHOWN(fd, -1, 0);
> +	SAFE_FCHMOD(fd, NEW_PERMS);
> +	SAFE_SETEUID(ltpuser->pw_uid);
> +	SAFE_CLOSE(fd);
>  }
> 
> -void cleanup(void)
> +static void cleanup(void)
>  {
> -	if (setegid(0) == -1)
> -		tst_resm(TWARN | TERRNO, "setegid(0) failed");
> -	if (seteuid(0) == -1)
> -		tst_resm(TWARN | TERRNO, "seteuid(0) failed");
> +	SAFE_SETEGID(0);
> +	SAFE_SETEUID(0);
> +}
> 
> -	tst_rmdir();
> +static struct tst_test test = {
> +	.needs_root = 1,
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run,
> +};
> 
> -}
> --
> 2.17.1
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
