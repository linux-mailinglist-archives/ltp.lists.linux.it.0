Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D894357333
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 19:29:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21D393C739B
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 19:29:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A84A63C1DD9
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 19:29:13 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E4CA2600C23
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 19:29:12 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 137HPAHa111690;
 Wed, 7 Apr 2021 17:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=t01B2BEJyZvpC7DkQlE6bRaCsIGK+FfRUkmC5jcszz8=;
 b=ylzmqnpM4d08yDYdEbKFU3fTqhQexUgOLp8W2HBaVLc65H+3lR+AMx5tT8ux9xaQLBQU
 clGClIpsg87aLObCgIufIj68lZhF0PYfzCjmUKEMdvgMSkIOdLXhXQHowiX1evybImMg
 yNnOprm74Yog1neTsQuqkkhwdbp226Arb05XIP9KLB8zuHYvlEUe/lq2djcGMkgI8zKo
 oPG7PNFcDGGk0NxRSVFcxSIve8Bai5nkczMR6amDqRxvrW15IKa/+WFDHIVd1emGO3Kt
 Lg5VXxtfjPk0Y/NjPyrXllkiRh5i7zAeHfAwBmd2WhcIN/C98W8ih+UtKcqdrbReJJ+0 ZA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 37rvas3cgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Apr 2021 17:29:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 137HP8b5102785;
 Wed, 7 Apr 2021 17:29:06 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3020.oracle.com with ESMTP id 37rvb060x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Apr 2021 17:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2aFsUtfAEr6Ru74+7+ls9G6xqqnUqhtKxLCbfEURAaPZuMygVdPqYRZxw6XTj2bF4XMvtvroHdw4TYh4vSIexSstDoT2m417PrmdKZsIkSDrVk1JOIQOXBtY9HO+jQVEXIHQAfHVdU4Iv7+LJ0aw6Z2OMJ/by7/DI7+YDRVrTpZvL2Es4RIw0PKk9uukWH9ZhGsNY5VVW7Ei8bCZxERP15LLVUjHHQVTAAuIokZB2rx9Z/K79BV930D5jvU1mdL+NRaJShTS80huDd4LXBW5exnNTR8XCUHLLYGZTiT5DaAFPDDUchAVvVfoGMAj5g8nGc6kJjbkQbwAcDMX7Bk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t01B2BEJyZvpC7DkQlE6bRaCsIGK+FfRUkmC5jcszz8=;
 b=oMApcv7V0/qx+bFW/f1/zJfc1BR3LF+8MrJ1plEpSeIxdRQeZ2AoW+8ssF0QPUtztCN7tFSk0HQ3OsiNEWUwePaif99lCvlSgvPCDx8bGNaf4BNjr4hEMhAT0/ScYMhNBqyUCNA5AMx0dcCKz219Gxm94kY2i3eAjDI4pL6m5PQ+sUYdPvKmblPisQzX5eP2nt7cqqEl39T/azfI7j/GL0oJIj1Qhrq7qw4vS3pFoc/zd+96OOX1f+Cq20GDlzn0nw0ZfB6VsBv0942S8W0YkCxKOxH86XExlzP+rmpcKRRQiIZY21f6ap1ZC/foEmkrDmDRO4bUgPqMr7ge0DlGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t01B2BEJyZvpC7DkQlE6bRaCsIGK+FfRUkmC5jcszz8=;
 b=ZPUPMTANuoxgwFiJDg12HhfJ4SQvc4yneTr0IN2tyWmJK93lq+ozWzdykSs4emNxL7NQDvJeSJCK5/6SkS3QLjy5tTB+PVtDbTtGC7JXrypBjZWJvO9Xw1l0L6hNYNwytcC97YOrIfOKqVR7Y6yy8PT227q6LYYaU6siNEtSC1o=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by SJ0PR10MB4415.namprd10.prod.outlook.com (2603:10b6:a03:2dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 7 Apr
 2021 17:29:04 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 17:29:04 +0000
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1616497037-19158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <c004ce6d-4e79-8fc5-93cc-0186f6700f27@oracle.com>
Date: Wed, 7 Apr 2021 20:28:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <1616497037-19158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM0PR03CA0046.eurprd03.prod.outlook.com (2603:10a6:208::23)
 To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.52] (95.161.221.177) by
 AM0PR03CA0046.eurprd03.prod.outlook.com (2603:10a6:208::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 17:29:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5be9fd7-8000-4752-4f84-08d8f9eaa3e4
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4415:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4415A6BF067BA558ECD3B381FD759@SJ0PR10MB4415.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /unkQvBC0ZcWhJSy1dytCbeH7XMWftoYdl5MqhrCFKw2ouo0dlmwQOeOoLhDDIaTlHhvHRmVoHAohOAwq3vXXWcf8wns1oIQ2iAdhO+eeMDgImNKHaPDoZrcs0S3ez6wb+sD/cWgC3j9P3P5C7i8OkvZMOEkR28jcvYlr475+HJfLdSc+5MQOxw7vw4P6St0yYR4deG22UXF3uZxuSYfHU66jWVO+qWjzAHrP+dEMuaYQsg7AYr4oT158QBpJoJHeSmmv9pRDn+LS63qERhukmDVDNGHlMgtRfA4yGpDVI5BVYTrmixX4CKXvo0X9qa1QlTqq4xUPwWrdG4lwIKYR7eVLrzisR0rsmZLanUUOrDOKGo2InFCy53ysMKxEDF+dTVDA0Q3LQBdPEt0xj3FtWV8IwyPNJAeIQPFuFSOgxDOnvV7afhbsJL7+9IGOPhj03JLufLRWwLOv75kyBxma/o20csEt/lJwbbFbIrtsC9Ww6XEiWcSAeHJhuKQMZRFtP6qtR+o2aiRm+ZvvVTivX+vrl9kZrEmdZlaDvNFsFgtF9lL5UKlWBp0GlAZFTST4MEGI9fbjJXC4YTnzlBb2P14wRJZJKsvav8Vzhf58k6E83UYZLSGJzt4LniOnwjSZlb6wLPzmZj6wJfHi/OCezz8InJFfa815qmHqnN2a4OfkTHN98yboI/vcFpmYbLxk1OWZXrYxgAzrNubCHOA6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(6486002)(478600001)(38100700001)(8936002)(53546011)(31686004)(2906002)(186003)(5660300002)(26005)(16526019)(16576012)(316002)(31696002)(66946007)(44832011)(956004)(86362001)(2616005)(66476007)(6666004)(36756003)(66556008)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VllVQi94ZjJWd1pRVVkvT3NoK3VJNzFONE4yZ1pEcDZvT3lwbHlneE95dWJo?=
 =?utf-8?B?QUJrcVJzOEprODM2NHRUR1dwL0gwYWJNWXFoTVBWU1AwZzVnTVBpVm5pU2ly?=
 =?utf-8?B?eWsvYzBZaUNWWW4rbFIwcW1LM3BVNFVqa2h2Y1pKeVFzakR6c3NyczVsY25N?=
 =?utf-8?B?Q1JJMDhNUnA3ZjhaVC9yaTdFeTZPVzNvUzhjZ0I3bzMvTW1oT05ESW1ObnBz?=
 =?utf-8?B?djVUWHZMYXE5NkdWckt4aVJMemJKajdQWk5EZnVQWm50TE1PcUQ4Wk9QVXMv?=
 =?utf-8?B?UmF1RjBrUnVhUE9Sb0ZCUFRJbUZ5L3lWbGpFTnFLZHJQakY4T3daKzlPMGk5?=
 =?utf-8?B?eXpVK1JWaHUyRGdiL3pNK1VBQ1hTUnpkdjRERVN0YnBMajFmYnY2RzdsTmNp?=
 =?utf-8?B?Q3VXbmdva3FyaXhaK1YreCtTQlZuWWxtVXpZd0FJT216OGJvbTFMWlhGVFJ4?=
 =?utf-8?B?OEdVR29hWVZjZ2VmQU5YNURkNE5sWUY1RjFFZHc4YTBrN1lYZ2NmZjREWmxQ?=
 =?utf-8?B?RGdhMlZPQ3JqdUJxVGRFMDJVMDQ1Mk8vNnF2Und0TjkrZVExZjdPWENnekRT?=
 =?utf-8?B?c3hFWUlzT25wd2l5UzJpdUFaSnNnYlVNWnB4VVhUbWVoTDJ3VWREWEJhZmJQ?=
 =?utf-8?B?aWVheWZiNElrQy85VnpoMUFsUmpQa0lxb29tN1p2ZFpkaEc0WDRORmRjYUY4?=
 =?utf-8?B?TmlQb1RhZ2VzVEJuaHRQTFRPaDd6ZmducDdZVExnZktwTm43QVExMjNWaWhI?=
 =?utf-8?B?QVRMczhWb2JNREF1QVIxYWZVeGZ4YmVMSWJQaEpOeGg4OEFIMEpCZ0k2N1pX?=
 =?utf-8?B?MTVoRi9pdlg3RFlsT2VJVTB3WWx4YzJ0ZEJRSnN6YW55SmpRejdpSm1UVVh3?=
 =?utf-8?B?c1o1UmNUT0pOU0oza2NScFBVelpHWmFNVXF0YmFyWVByM28rbm9EUGFPNVU1?=
 =?utf-8?B?NmFPYitucjllM0V4VFZJYlNJZDJzaXVHcUdzYkZCVFF3djR1NFFuZVNYczcw?=
 =?utf-8?B?N2EwNVdyc0FheWEvL0lLdDE1VjF1QjE3S0l3V2RmbVhNbjF3ODB5Z3p4ajBl?=
 =?utf-8?B?bFkvemZRWGpJK2lkclU4bDdybUNpRzI3cDZPRHZkcU1lU1A0Rit4N1dpTVY3?=
 =?utf-8?B?aEJPd1pMMlI4TldjZXFvemQySnlOaDBlTmpEZnFsNkJkc2wyL2pqY2pTUCtU?=
 =?utf-8?B?aFFxbkgvSmNHdWRlSXp1SGRUVDdCSXlFdlJiYmk3K25PL0ZFNHAxZ3o1RXZ6?=
 =?utf-8?B?QWg3TUVnUGNIaithZjQwTWpDaituVFZ5ZGRUbkFEY0grUHhWUVNheUVDQWNU?=
 =?utf-8?B?TFdLam5aSVovRXpkclRRTVYzbnFWd2RtcG9kdlQwcU5aRE1VRCtZbi9DTE1X?=
 =?utf-8?B?Y3BLTFBkcG5mOFpXc0tVNkQ3WU9Fa2FkQUhoWHJ3U2ZzcHFrMUJqQ3F0MkRD?=
 =?utf-8?B?aFhLdG1jbG5OT055YVB4Mmx5VlJZTjl3N3B0SHlpRlFXdUNvMlFTYUUvKzNG?=
 =?utf-8?B?enFGSUNXaWpPa1FKTDI4ZndJMXlQU1AvaEdlTXhzOGxGbFljOVhxSW1NbDND?=
 =?utf-8?B?WndZUWR3eHhYQkJPUSt0MDczVXIrY1ZRdWxBTFhORnlWNURoRmRVODVUUW5o?=
 =?utf-8?B?dk1LOFYxUHY3YjFONnJKMUhUOFFIcFA4UHNPb2JQczBYWjd5aWJRTkJ1Q2E4?=
 =?utf-8?B?dW9sMm9ac0laVDhRMEJXSzBNaXdFdnhCMW9yMTR5WDdBYkFNU0tnL0VDS1FH?=
 =?utf-8?Q?uxSCE80O1m39m8TQg0WChk4u9idfswuPd6pXOfQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5be9fd7-8000-4752-4f84-08d8f9eaa3e4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 17:29:04.5854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8s2B33SftSG92SAeTneTV18LwICtqPJjLs+hniTMlaPUtXzrlXc4G5h7IloP6ryJYrZoQeKpIPXxLI6sBO/BHN/T5sgiHa0QUjzu2e38Mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4415
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070119
X-Proofpoint-GUID: km6IpFGGifCF2r3wDbOo665tik-N2L-V
X-Proofpoint-ORIG-GUID: km6IpFGGifCF2r3wDbOo665tik-N2L-V
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070119
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] tst_safe_sysv_ipc.c: Fix wrong ret_check
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

On 23.03.2021 13:57, Yang Xu wrote:
> From: Yang Xu <xuyang2018.jy@fujitsu.com>
> 
> Since commit e9e508aad1("lib/tst_safe_sysv_ipc.c: add other cmds in ret_check"),
> we added these cmds(SHM_LOCK, SHM_UNLOCK,SETALL,SETVAL) commands into this check.
> 
> It is wrong because these flags are defined in different system headers, the same value
> can represent different meaning in differnent headers. ie. SHM_LOCK is 11, GETPID is
> also 11. SHM_LOCK only returns 0 and -1 but GETPID returns -1 and postive num. ret_check will
> idenity it fail even we call semctl with GETPID successfully.
> 
> Fix this regression by using different ret check for msg/shm/sem.
> 
> Fixes: e9e508aad1("lib/tst_safe_sysv_ipc.c: add other cmds in ret_check")
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  lib/tst_safe_sysv_ipc.c | 52 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
> index 012f5ba38..7a3c515e6 100644
> --- a/lib/tst_safe_sysv_ipc.c
> +++ b/lib/tst_safe_sysv_ipc.c
> @@ -13,28 +13,54 @@
>  #include "lapi/sem.h"
>  
>  /*
> - * The IPC_STAT, IPC_SET, IPC_RMID, SHM_LOCK, SHM_UNLOCK, SETALL and SETVAL
> - * can return either 0 or -1.
> - *
> - * Linux specific cmds either returns -1 on failure or positive integer
> - * either index into an kernel array or shared primitive indentifier.
> + * The IPC_STAT, IPC_SET, IPC_RMID can return either 0 or -1.
>   */
> -static int ret_check(int cmd, int ret)
> +static int msg_ret_check(int cmd, int ret)
>  {
>  	switch (cmd) {
>  	case IPC_STAT:
>  	case IPC_SET:
>  	case IPC_RMID:
> -	case SHM_LOCK:
> -	case SHM_UNLOCK:
> -	case SETALL:
> -	case SETVAL:
>  		return ret != 0;
>  	default:
>  		return ret < 0;
>  	}
>  }
>  
> +/*
> + * The IPC_STAT, IPC_SET, IPC_RMID, SHM_LOCK, SHM_UNLOCK can return either 0 or -1.
> + */
> +static int shm_ret_check(int cmd, int ret)
> +{
> +	switch (cmd) {
> +	case IPC_STAT:
> +	case IPC_SET:
> +	case IPC_RMID:
> +	case SHM_LOCK:
> +	case SHM_UNLOCK:
> +		return ret != 0;
> +	default:
> +		return ret < 0;
> +	}
> +}
> +
> +/*
> + * The IPC_STAT, IPC_SET, IPC_RMID, SETALL, SETVAL can return either 0 or -1.
> + */
> +static int sem_ret_check(int cmd, int ret)
> +{
> +	switch (cmd) {
> +	case IPC_STAT:
> +	case IPC_SET:
> +	case IPC_RMID:
> +	case SETALL:
> +	case SETVAL:
> +		return ret != 0;
> +	default:
> +		return ret < 0;
> +	}
> +}
> +
>  int safe_msgget(const char *file, const int lineno, key_t key, int msgflg)
>  {
>  	int rval;
> @@ -103,7 +129,7 @@ int safe_msgctl(const char *file, const int lineno, int msqid, int cmd,
>  	if (rval == -1) {
>  		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"msgctl(%i, %i, %p) failed", msqid, cmd, buf);
> -	} else if (ret_check(cmd, rval)) {
> +	} else if (msg_ret_check(cmd, rval)) {
>  		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Invalid msgctl(%i, %i, %p) return value %d", msqid,
>  			cmd, buf, rval);
> @@ -173,7 +199,7 @@ int safe_shmctl(const char *file, const int lineno, int shmid, int cmd,
>  	if (rval == -1) {
>  		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"shmctl(%i, %i, %p) failed", shmid, cmd, buf);
> -	} else if (ret_check(cmd, rval)) {
> +	} else if (shm_ret_check(cmd, rval)) {
>  		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Invalid shmctl(%i, %i, %p) return value %d", shmid,
>  			cmd, buf, rval);
> @@ -219,7 +245,7 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
>  	if (rval == -1) {
>  		tst_brk_(file, lineno, TBROK | TERRNO,
>  		"semctl(%i, %i, %i,...) failed", semid, semnum, cmd);
> -	} else if (ret_check(cmd, rval)) {
> +	} else if (sem_ret_check(cmd, rval)) {
>  		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Invalid semctl(%i, %i, %i,...) return value %d", semid,
>  			semnum, cmd, rval);
> 

Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
