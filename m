Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F223035F5C8
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 16:12:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3FDA3C70E4
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 16:12:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A9663C1B4D
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 16:12:23 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7FDB06012DB
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 16:12:22 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EE3pLF133318;
 Wed, 14 Apr 2021 14:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3VKhE5+REAeT4J5m2fJxw9qKT7DvzafHnBm7pZgl6qY=;
 b=E8TfwieOev+p3t98gro9Hbjx8Lvsj8KDBdvwz/k4bLP5wze0l66cdGPaNHRwpgL/nHDA
 JhqHA+Yv9i/JlM62NyNlsF/PHyIaVJ3kkHtAcYTQqFghaVyRGAl0nPcB/c8Fthqpb0bi
 3KM+0tPCMTtg4TihHb0UBgy4BpyvDwhg60xYTr4w9cUSCJTystfQ/1GXYIX0e+6elj3C
 bnMSFrw+cXnblSu8wAOFYCvFNRXbGp/uXXb3gkcrSw7b2QVSfHwptI3OCd3L3SW1RBJL
 rKStSvUBIJJ50p9826CCu6glHDmG3VklnNiCsR6TfeUU6jjpskJg40JUg4rU3mLgXuyD Dw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37u3erjk3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 14:12:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EEBjIq106630;
 Wed, 14 Apr 2021 14:12:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 37unx1chvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 14:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br0ae6sc1g+4YMliKbnDvSfbsf9wz7gznfDUYLv07zJTltOeRZ/WIFkJ5cNsZCwK4FracB7vOYUGGNy0EXnZ7xJApd+5y3zCOvOx1f/rNP3DgXElGYVQzHm1LJpuLSwEQUYpyuiXxLbz5+77dwqtisOV8MfhVEm//U8Eoht9H0rlr7yNBcZh/2sLscJ3VMxWk8wBtlKrwxndutrINBCjMofuwAsEQgvol0GehtvGhR/JDZNuiXs2EOdaQ3fFIjQgAtIhheCbPpSyEGDgxbUdaAtYtvN6NG5ujJ5y9mItPxElW0WuANIZD+xaElCVm8FZ1W5agZGQcJqeGUrDTjHRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VKhE5+REAeT4J5m2fJxw9qKT7DvzafHnBm7pZgl6qY=;
 b=bS9eQIiBeKSMnbei9SJVrsh/TAgEn0EJqpxuT3kld2HPJJgPRfv7jB0SXom3aaqyBDp4dRgYH6x2KUNWVTfeRam15iiNFCtKxuTlZjh7tFV0xaDqQL2rUrTAPbSKKh/XGbnUPQMcfzfH8YL/MMc6RxBBQS5Hx5B8rRyn0fniQaXHA9wJrrCWiW6UNxr3UsKt5fa15Ji+D23Hu+8txmy0v/2xtSrcxAs7rCfJSSyBWSotauXM14Wc1r+HJAGFaUQ6UgPfBREg/qPqK0p7eFmUhQBCBaRQeBhtBdqqcGHbRsixOegIGBTfeAhqbcKwKKzi9TSrseRXY+60ppGwSL386A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VKhE5+REAeT4J5m2fJxw9qKT7DvzafHnBm7pZgl6qY=;
 b=dKYY7ieQ+elJ3V/EE++LjIeqDAbMLByE4I9iVqSx0Qn6kT7FexmtyDHir0aZd/eB6jVOxPAGJkVZ2bSvQTMMyGsdFWEcS2/bmpLftHDz629WFdIDEknCCFH7PhFWgSVv4DOh0asHWa85d/U8bLT4NtQ9boLPL7loJkm03XSZpnQ=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by BY5PR10MB3988.namprd10.prod.outlook.com (2603:10b6:a03:1b1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 14:12:05 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.4042.018; Wed, 14 Apr 2021
 14:12:05 +0000
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Xie Ziyao <xieziyao@huawei.com>, ltp@lists.linux.it
References: <20210326031254.202606-1-xieziyao@huawei.com>
Message-ID: <67a24192-90b2-c6bd-bca6-3cc9a9a8bc6e@oracle.com>
Date: Wed, 14 Apr 2021 17:11:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210326031254.202606-1-xieziyao@huawei.com>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.40] (95.161.221.177) by
 FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Wed, 14 Apr 2021 14:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5e81036-c8e4-4b4c-71c2-08d8ff4f484b
X-MS-TrafficTypeDiagnostic: BY5PR10MB3988:
X-Microsoft-Antispam-PRVS: <BY5PR10MB398836105600189542FC9EAAFD4E9@BY5PR10MB3988.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e7BZBoT06in2ZedTzGsRFpsQUgwpFNv5Pwk5IMAe+L6A5hapJiuypAw3OtRVDEN4t90IxZi9BOh9fRKy3mgOh2EBqYnaYRcLA4R0D8YkeY7B9AnzkS+/T0iLII2Tkt/qm4ahUwYY+bIO1gt5mPiIZQL/5JiQpVgngX9UcX/F11cDt9gHhsJKwA6iyGuHXOmssK44miNaIooNg9kyKltESvdggL/fyq5b7/9PorRfz+nifIIr7sT9upG362jVWA8wbyUzqFWyqUyY5UubMUv0IyFxVLdKn0nU3+bk1uvAVol5Dw90tAMkXQsvm6ECv78UtZTM2npaRSRK8U6avwGH6nVvV1FLzFSzWBAdVUGk0n4XsREPBWfgiHVVHST9vXfhmQWTs6qMW6MD+1fyrBiA8TPXPCLtTU3q2Fsmf+DVDZVvaAotkqAMz4OV0qD3isEvtrQ+Q+mfc6WD+eGXaEF8XYkJ07PcSiQ4Uyd5i9yhihDFswm5XAt4tYOKbXixJLjoESmM9HB+45IRtc67ijFbRHlVljoafa+vCiIjMgIbg4bYz6sJJbXwSUCO/O1mVSHmRoZzY3I/9rmJWRF7mFm1fS7InkGV37FD8dqES6pVwW674zfZBInt1B6lDDLtWTPZU9WbekVFnrkppV+UkKlh/k5j9seeldkHT8H7/4C6e42sTU5Mq2M7LTYSBoYiTWyoWwyI4vv9Cx4juvIip5PRLSbMufA+JPU8DXb1ROtO4akj74hQZHTujJxZUfsZG7frckjkTFrJ0Y1IfrvKsGi8pI9mjT9JMo5YHnzMK4JReRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(136003)(366004)(376002)(39860400002)(6666004)(83380400001)(31686004)(86362001)(8936002)(8676002)(966005)(2616005)(44832011)(31696002)(2906002)(186003)(38100700002)(16576012)(956004)(66556008)(26005)(5660300002)(53546011)(36756003)(16526019)(478600001)(6486002)(316002)(66946007)(66476007)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OFJWZTlCV3hYbFpmMkI1MGhoeXdQVmYyK2hBWTZKekplSVNESCs2bUsyNnNv?=
 =?utf-8?B?a0hCNTcyOWRBWngwQWoySXBjeFlHc2syQWJYZnZvc2liOEdpTjZtT0g1WWVa?=
 =?utf-8?B?S09neUlOa054QnF3em5uMktWOU5nb0F2RVRJaHFLdTBxUm9VTVZoYlZ6cGds?=
 =?utf-8?B?cSs5eU90QzMzT0FXNXdlV2dEaUo4VENveTc0cVdyMHJhQ2JkYkd0RHZJNVBl?=
 =?utf-8?B?R2EvUjk0TGc1SW5ybUkrb0l3TjNkSUFVQnJtenM5VDNTalU4U29MVUNNVE5G?=
 =?utf-8?B?R2hOampZT0JOc0ZJK1lIQW1GZzNhYk44NUlEaGtlWlpkbEE0M1Zld0I3bUJu?=
 =?utf-8?B?TXdmMU9MRk1NcnJwZ3d4L2ZCSUhQdXlqN2tpZlBzNk1TdTNZMTF4dGxSaHZX?=
 =?utf-8?B?dzlOYmFrY1hwREJVTm9PcW5GY0lhUWIwZEJUbXE4bWMyVTFxVSt4WDg2eml5?=
 =?utf-8?B?UzN3MjBSWGpPVTkrZWFqQUlORUpSeFZKTTFVeTh3UFBTY0JMem5zdlFoU3Jm?=
 =?utf-8?B?ck1obFBxY0piQ0tqeHVUUDQxbVc4OFQ4Q1hvWGhtMjJCWDRZU1dKLzRmam02?=
 =?utf-8?B?NlQxTWNyWElBTXJtWmhvL3JPVWkwZFAvU1JZZUtsYklwWHdlakVNUW95bmIw?=
 =?utf-8?B?Slhyc1lHcEJsQjY5dkhnMDJ1ZmY3WVNJSG4wSVlKOE9SVEE3UTd0c0RsM1Zx?=
 =?utf-8?B?RVd5Z3E3R01aWmllV0lSSEJvRE44RU1kM3liRjFrVGhJUktKSzhrYnJ4OGgx?=
 =?utf-8?B?ZE16UURqN1hXYWJxR09CNTJQSzJoMnFXMzBoZ0hoV0o0aTZkZVNBUW5ZQ2ww?=
 =?utf-8?B?MDVOSzIwOVZXMkpiblBCaVpJOEt0clZzdnkrQkVZeFZlZ3RLMFovNmx1ZnNX?=
 =?utf-8?B?cStSWU4vaHVuaXlvNzJRUDludWlPV1FLY1FGcXBaWnVJejlWM2xLSFppekNY?=
 =?utf-8?B?OC96K1N5UDhETUg3R2l1MTZSc1daejZaUlUrcjR2cndOUXZPbkFPRHRuZGdr?=
 =?utf-8?B?R0hiSGNQNCtQTVRkSzJzLzhRVjBNNExDNlVZK0VoY2VmYWRxT0l1aGNBZHpn?=
 =?utf-8?B?RmdIb25lTFgxVlF6dmk5WnpHT29zU0F3RTJ0NFAwVDFxSTVLSUxZcXJvbnZ5?=
 =?utf-8?B?S1RabHlmWmVJT0lQK081aXBoSUk5TXV1R3NSSTg2OW95QzJ6TDIxSnJwOFRk?=
 =?utf-8?B?amZ6T1FlTTRscC9rN0c0UVdod3o3UzJIbGtqOExqWm1QSTlTRy9NRS9tUHRE?=
 =?utf-8?B?aXFiWTlYekZ1UENkTGZvTlZoaGRMZnU4VU5jZ1NxSTZzd1dEWGRKZWpkMksy?=
 =?utf-8?B?VDd1aUh3QXR4akNyb1FDQ2s0MDl1UnZwV09iNG1MWDQ2OUY1ZlBPTU9CVHYw?=
 =?utf-8?B?Qmora2FrWVNZWWZDc25qcjBXSEY0R2toRDBUcWljUGZnMm1tRDMzd29OaVUy?=
 =?utf-8?B?eU85VkZoSXNwM2RZL3ZUbnZuOUhQTVhYeWIyT3RSOWJFa2piZ3FKRExjU3dl?=
 =?utf-8?B?cVMzWEg0SnhxUWNYWFZid1Q3SEtFMXh2YkpaVWJnSGpRelV5bGhNR1kvZ1Jx?=
 =?utf-8?B?SFdLaGYzSm1uRjZnS0QrRldvY2NnU0E0T2ltQk1POG5sbHJQRFlyK3lNRm9C?=
 =?utf-8?B?UG5jSUFzOVQ1SkRTRHdaNmhmK1JhZnd6UXFYNzB2QWNpZld3ZFh6NTZObFo1?=
 =?utf-8?B?MTUzZ0hGR2RucUQrZi9HZUlIck5pOTJDV2kyMXRLdk03SHVKQVBDS2lrZHZT?=
 =?utf-8?Q?D+6LE/oqbQaSlI5I29+1+PSDB1LyQoYyvpJO2bv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e81036-c8e4-4b4c-71c2-08d8ff4f484b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 14:12:05.6786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBmMKomm1bg62FniFHyTfgEkIWGBQtsof/OxPefLCWxuq6tZ2cQgUDqNfRGPK5UlqLI81v9/RYzWKlNSmXocBf5cZwKdljLyGAspGnb30xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3988
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140099
X-Proofpoint-ORIG-GUID: RJOdRdcwAmqJDn758BcLTLu46enqfiHg
X-Proofpoint-GUID: RJOdRdcwAmqJDn758BcLTLu46enqfiHg
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1011
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140098
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS,URI_NOVOWEL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/chown: rewrite chown/chown01.c with
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
>   testcases/kernel/syscalls/chown/chown01.c
> 
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
> ---
>  testcases/kernel/syscalls/chown/chown01.c | 189 +++++-----------------
>  1 file changed, 36 insertions(+), 153 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/chown/chown01.c b/testcases/kernel/syscalls/chown/chown01.c
> index 2e42153d6..a263db1bc 100644
> --- a/testcases/kernel/syscalls/chown/chown01.c
> +++ b/testcases/kernel/syscalls/chown/chown01.c
> @@ -1,179 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * Further, this software is distributed without any warranty that it is
> - * free of the rightful claim of any third person regarding infringement
> - * or the like.  Any license provided herein, whether implied or
> - * otherwise, applies only to this software file.  Patent licenses, if
> - * any, provided herein do not apply to combinations of this program with
> - * other software, or any other product whatsoever.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - *
> - * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
> - * Mountain View, CA  94043, or:
> - *
> - * https://urldefense.com/v3/__http://www.sgi.com__;!!GqivPVa7Brio!K38BOnObiPoxRPvXRHJYzDyzV8BKNGdZqVCqrhJBHAsp630RZ__NSCORk-tOnZMBX6-b$ 
> - *
> - * For further information regarding this notice, see:
> - *
> - * https://urldefense.com/v3/__http://oss.sgi.com/projects/GenInfo/NoticeExplan/__;!!GqivPVa7Brio!K38BOnObiPoxRPvXRHJYzDyzV8BKNGdZqVCqrhJBHAsp630RZ__NSCORk-tOnfjKGQhh$ 
> - *
> + * AUTHOR: William Roske
> + * CO-PILOT: Dave Fenner
>   */
> -/* $Id: chown01.c,v 1.6 2009/08/28 11:59:17 vapier Exp $ */
> -/**********************************************************
> - *
> - *    OS Test - Silicon Graphics, Inc.
> - *
> - *    TEST IDENTIFIER	: chown01
> - *
> - *    EXECUTED BY	: anyone
> - *
> - *    TEST TITLE	: Basic test for chown(2)
> - *
> - *    PARENT DOCUMENT	: usctpl01
> - *
> - *    TEST CASE TOTAL	: 1
> - *
> - *    WALL CLOCK TIME	: 1
> - *
> - *    CPU TYPES		: ALL
> - *
> - *    AUTHOR		: William Roske
> - *
> - *    CO-PILOT		: Dave Fenner
> - *
> - *    DATE STARTED	: 03/30/92
> - *
> - *    INITIAL RELEASE	: UNICOS 7.0
> - *
> - *    TEST CASES
> - *
> - * 	1.) chown(2) returns...(See Description)
> - *
> - *    INPUT SPECIFICATIONS
> - * 	The standard options for system call tests are accepted.
> - *	(See the parse_opts(3) man page).
> - *
> - *    OUTPUT SPECIFICATIONS
> - *$
> - *    DURATION
> - * 	Terminates - with frequency and infinite modes.
> - *
> - *    SIGNALS
> - * 	Uses SIGUSR1 to pause before test if option set.
> - * 	(See the parse_opts(3) man page).
> - *
> - *    RESOURCES
> - * 	None
> - *
> - *    ENVIRONMENTAL NEEDS
> - *      No run-time environmental needs.
> - *
> - *    SPECIAL PROCEDURAL REQUIREMENTS
> - * 	None
> - *
> - *    INTERCASE DEPENDENCIES
> - * 	None
> - *
> - *    DETAILED DESCRIPTION
> - *	This is a Phase I test for the chown(2) system call.  It is intended
> - *	to provide a limited exposure of the system call, for now.  It
> - *	should/will be extended when full functional tests are written for
> - *	chown(2).
> - *
> - * 	Setup:
> - * 	  Setup signal handling.
> - *	  Pause for SIGUSR1 if option specified.
> - *
> - * 	Test:
> - *	 Loop if the proper options are given.
> - * 	  Execute system call
> - *	  Check return code, if system call failed (return=-1)
> - *		Log the errno and Issue a FAIL message.
> - *	  Otherwise, Issue a PASS message.
> +
> +/*\
> + * [Description]
>   *
> - * 	Cleanup:
> - * 	  Print errno log and/or timing stats if options given
> + * This is a Phase I test for the chown(2) system call. It is intended
> + * to provide a limited exposure of the system call, for now. It
> + * should/will be extended when full functional tests are written for
> + * chown(2).
>   *
> + * [Algorithm]
>   *
> - *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
> + * - Execute system call
> + * - Check return code, if system call failed (return=-1)
> + * -   Log the errno and Issue a FAIL message
> + * - Otherwise, Issue a PASS message
> + */
> 
> +#include <stdio.h>
>  #include <sys/types.h>
>  #include <fcntl.h>
>  #include <errno.h>
>  #include <string.h>
>  #include <signal.h>
> -#include "test.h"
> -#include "safe_macros.h"
> -#include "compat_16.h"
> 
> -TCID_DEFINE(chown01);
> -int TST_TOTAL = 1;
> +#include "tst_test.h"
> +#include "compat_tst_16.h"
> 
>  char fname[255];
>  int uid, gid;
> 
> -static void setup(void);
> -static void cleanup(void);
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		TEST(CHOWN(cleanup, fname, uid, gid));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "chown(%s, %d,%d) failed",
> -				 fname, uid, gid);
> -		} else {
> -			tst_resm(TPASS, "chown(%s, %d,%d) returned %ld",
> -				 fname, uid, gid, TEST_RETURN);
> -		}
> -
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	TEST(CHOWN(fname, uid, gid));
> +
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "chown(%s, %d,%d) failed",
> +			fname, uid, gid);
> +	else
> +		tst_res(TPASS, "chown(%s, %d,%d) returned %ld",
> +			fname, uid, gid, TST_RET);

Instead of TEST() and return value checks we could write:
TST_EXP_PASS(CHOWN(fname, uid, gid), "chown(%s,%d,%d)", ...);

>  }
> 
>  static void setup(void)
>  {
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	UID16_CHECK((uid = geteuid()), "chown", cleanup)
> -	GID16_CHECK((gid = getegid()), "chown", cleanup)
> -
> +	UID16_CHECK((uid = geteuid()), "chown");
> +	GID16_CHECK((gid = getegid()), "chown");
>  	sprintf(fname, "t_%d", getpid());

What about using some constant for the file name?

> -
> -	SAFE_FILE_PRINTF(cleanup, fname, "davef");
> +	SAFE_FILE_PRINTF(fname, "davef");
>  }
> 
> -static void cleanup(void)
> -{
> -	tst_rmdir();
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.setup = setup,
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
