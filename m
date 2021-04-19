Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6D3647F5
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 18:09:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCD753C9CCB
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 18:09:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B7C33C2009
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 18:09:47 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B39DC1A00486
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 18:09:46 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13JG5mES007633;
 Mon, 19 Apr 2021 16:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=7QfSer2HxtErXp3lY64nraFj9w9/N22F4NYqa8/wF/U=;
 b=St9rBHeFswG09v3PZorqKxV258M+RiMSBZTPQA1ZY+WPpCfxHRRwdwGyEairjs4d3d22
 /deOBsmW/6cjQMF2vDriyw5yxYY107YnbZJGJq6YebVosOZrPnK0IwER2DBmnhGkS4a2
 anWoRUogo9tHwlUQtpy+c5hEd/0219CE/5OowOyEzPZx6/i//iCCRFT3ojFvRGN3qO0L
 Xbq4fObzmv+N9g5Oop43CrqU8M43eZakHEZWwBcRBipcJae5P91ruPURJChBtUxXQoTD
 VGMFpHqW5fVsSzTaEUb+X/RuzhrFvuDEnuq4anFGkywcULZ3DJuIMvia7Su4SgvFDXav qg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 37yn6c4a9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 16:09:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13JG6lh2098273;
 Mon, 19 Apr 2021 16:09:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3030.oracle.com with ESMTP id 3809kwn2f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 16:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBBGfq0qBdiD6pbMkEwjat7G5zFhtGIGaHCSYMmhfrPRuyIidc8Bps7xZweaNlNi8Bb0GyiuPC/DB2jrhfMldq7zrR9BplABHU32ZD+7irMS1QK4fRX20+b5lmN5sMhpE8KFcr5JgumZiEGpe+JKsTSJxF7W2gFyeJco7geR/NcOJqQwK8FzK+9IqX+sJpGqiz5euceMhKLSeTbb3ehq+NKbpAnGMPYCx//4+Q8c66sBjoP3f8ghq2VYJuU2utqbKVhsfOvjxQ4KMOyMfenukmnHwMTvSBWx87ZoCp1RhhuuRA/aBMHWimxJiElELBX0QixfDCYCC6yFljznjp3ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QfSer2HxtErXp3lY64nraFj9w9/N22F4NYqa8/wF/U=;
 b=NSMytyidP8H26E8DkU6lnV2dVjIlE4plKjl1A5BfD6UddltR2eOd1+gj1ubdxf4fBfmZQYk8VuDkzylCyhRLQMmXMWUe+JjsU6CbRctmk8XLO2RDmHOShaZuqsaVul0zVYAzwfEkvgvl3FFp8I8iOFERc/t4q7tJ0t0yHnSqXRLcud67J+eB9KN0/VO+FEef37F0zVeLaoxDF0W/z1BUF+d2WnSvEzhYuJ5kRHJRAw6oYJhC4CULNHfDp6d3/R8z/xUnCKzrY3dybWqGUEhtLmTAAHAPJX7ZtUKeM6XsMYC+JK4PyCKFwlb2ACFURenbmMO/1H03vWfNsjYxc7+EoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QfSer2HxtErXp3lY64nraFj9w9/N22F4NYqa8/wF/U=;
 b=Jg+tTr0Y6O1dSOwq85E+xpjy2dxDZ2yqVGvhikw6Rr28XHb9RDgxr16G61xMnu5wLBlbc73jbEndqWVyWNlzMASH4FsSrAlrfBgUfsspVDYGJfsNXGEngJWifdMUKRpa3gAFHLhk+8UA7qqFNIkD4uvioeQ8suYP3dGEVHGOpbk=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by BY5PR10MB4211.namprd10.prod.outlook.com (2603:10b6:a03:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 16:09:30 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 16:09:30 +0000
To: Xie Ziyao <xieziyao@huawei.com>, ltp@lists.linux.it
References: <20210419013427.247615-1-xieziyao@huawei.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <60ae8451-30f5-9b82-dcdc-11b97e29099e@oracle.com>
Date: Mon, 19 Apr 2021 19:09:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210419013427.247615-1-xieziyao@huawei.com>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM0PR02CA0079.eurprd02.prod.outlook.com
 (2603:10a6:208:154::20) To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.43] (95.161.221.177) by
 AM0PR02CA0079.eurprd02.prod.outlook.com (2603:10a6:208:154::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 16:09:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fbb968d-bd80-4898-222c-08d9034d837c
X-MS-TrafficTypeDiagnostic: BY5PR10MB4211:
X-Microsoft-Antispam-PRVS: <BY5PR10MB42119132AE6C23732B301257FD499@BY5PR10MB4211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6z2xMbWZ4sp1eD7NAPgbooPE7mvDRrtAGfQuZWbGsIFROtF7qNOnyXhjGDd6Pn6f3WTqvC4zigQrs3owmYhKA7q3Ju1nbWcmv4LDuPAbRvAjVMNHn1HtIKttgw2pITYXCCbN0abt22knUh5owlqVfQ0PqonqX2LexKqffS3SWKh3rg7k9U10Fbriqnzc0mNLa09f1jff+hMYGSlz51d69X6qo25FHJygLyVVptzOYUV4Tc8Q2XT1IWGsXOH9wF6kHFUoxHKcjYUTNLJVShVJWywgnv9U1XrejG+FsFv07ddAMkDEwsLVfsi5u4PKmnVgLSTkEv1n5H6t5RgK+zAJkvQaqKSV2Y7atCfFtIRF/rN9zp2bUytvg8YTcovwD1OcCDmxiq7wfQR5/BuFnwdKkleQMATdsSSik8erDK5VNr4D2CYz4Wao2qRWCq0O2MKIjy3vRLY95pD75IId3QdEE2UxrWDgs0DmXsSRUjRcS6MVwsQSq96/yz9SkHPN9K0ugTsY1XDM9DE68p5Wul8k1XFePPuOUXRNo8yncXMO7WwafUBTrVPxlM9rOATU1Do3E9t6kjl/9FU9LC8zMlg8kmUBNf5yuOMyZj79mxmqUzXf/4FVN3xDm2/bwKhhQLje9xhEAHe7LZptrPf2V7/0WNq2TIX2ZIttRmZHB9RNvuNNzFTqkkIz0Qv6rGKt8zV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(16526019)(26005)(31696002)(8936002)(6666004)(38100700002)(86362001)(83380400001)(478600001)(53546011)(44832011)(16576012)(956004)(66476007)(66556008)(8676002)(31686004)(66946007)(2616005)(36756003)(2906002)(316002)(5660300002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MEhmbzc2SWdNQ3c4aGkyUnR6R3VpNFZ6ZE9CZWt3Y1hQL3d2eW44ZElZbjRr?=
 =?utf-8?B?RWhJM0kyS2pjbG83VmhhdnFaeXZsN3BzUFY3bjBQS2c5N2hBdkxXdDVsM0Vy?=
 =?utf-8?B?UXdSS2l1aFZuWVVLZExQYWFUMDJiaXhEdEw1azdsb05LMVVLcmRybzFMZ1ZT?=
 =?utf-8?B?MEVRL2NqMWtMd3ZtbTNGYkYvWTJ1SDV2cTgyWjNLMm1RemJwMDJqZFFmaDli?=
 =?utf-8?B?TXJ4UW9ENS9ZZGVTSjlnR3l6RlFFR1BjVmEyL1dGUWJlcUY3TURIeDVYNmNn?=
 =?utf-8?B?ZVNFTlBSQjhOYzJjOXI5aEFlZ1BVNFIraGQwd1NFcnNvQlZjNE0yU3U0b2lF?=
 =?utf-8?B?WTJqQlVJeEJQeTN1ODVmL0NVWmNqZUovaEYyWXRJQjA2YUFQRkk0WnQ5T09u?=
 =?utf-8?B?TjNiM2N6VWZScDlnZDVGcHZ2cWdPSnZtZmV2SU1iWFVaQnFVUUZqMDBqNENC?=
 =?utf-8?B?UVMyOUlxWWNJTW1MeHRUZzlJUzZCMVIvQ0o5YUFkR3B3QkMvVXpkM1E3R3Va?=
 =?utf-8?B?UXltWWZYd1p2TFp0ZVk0N1Z5czF0bFUzdk1qVTNRbjhOZTR4T1JsNDlKZ2px?=
 =?utf-8?B?ZTFQNUdDb0t1L0lia0pjbU5LREpOU2EwbnUvQjRPS3cwMWpKOTcrTERpOENt?=
 =?utf-8?B?alFwa0NlV0llb0JsMU1Rc0JucXcydnE1d0xFci81TVZjcDhranZCd05NcGhS?=
 =?utf-8?B?QjhRM2o0VzRVbHRpZXJscjVMTXVOWWxXRGV1QVFmbHJHR0k4WUpLL1I2RWE4?=
 =?utf-8?B?WWxReVZJYmI0OE53Z2ZwczlzZ1BmTW9sZVNwNXdwdS9ya2ZtejZjeHVCZHVi?=
 =?utf-8?B?STVrT1VOWXlMV0FvaW1nNFFvMmxZa2VkSEpVTXRtcW83a1NTNmN2THVuK1ZD?=
 =?utf-8?B?OVNxZTliWEl6OEoxYUhITTlHVTM4bjNTN2NSdHBDN1lsNDdGOFJrQS9hbVlz?=
 =?utf-8?B?TStzVnRaSUc0Vk9NZmJwbGJlWXJBMFZmNTJTS1RDcHVpelhwRnZtOU1aeHdV?=
 =?utf-8?B?OGNqdEpXWjlTSmRGZlQwVGxGWXBEYVJuS0ViV3B3LzhNMzhqN0I2NGU4bm9x?=
 =?utf-8?B?d2k4cTM0UnNtNEJ2QnRiMjdRb3diVzJCYVQ4RXdHdWlQOHdrYUVBSDhLVGhm?=
 =?utf-8?B?UklOOGFPVDFTZjZlb3pjSlJkSldrWVVyTkVqaFZmZEYxcWljN2pvUEM5QWZU?=
 =?utf-8?B?dWpOMDNOOGtpR3ArUnB3TUFUZ3hvYWxEMk1EMTBicHNaZkNzc0w0YlBZeTJl?=
 =?utf-8?B?R0RpOEN6ZnN6QnRjZUsyRzNjMFZTRm1qNWVPb1RXSVRpSy84QzFRY0ZWS2tI?=
 =?utf-8?B?bzRCWkpFR2ZUWm1IUVF0Ykh3YnUrcnFoS01GSVFxOWRCVkhXbGlmZkd4VFgv?=
 =?utf-8?B?VWdRbzc5dDJOd2xUeEl0RHpWY1BjS1ZZTWJPbXBjK2lCMW1UN1VRSWNmdDg0?=
 =?utf-8?B?bEdjTUNpdnpWSFIvVzEzekRXTW4ycmlJcmRuRnM0YisvQWwySzN0ZUl5Z2dG?=
 =?utf-8?B?aEpSaWFBOG1hb3ZnUHp0aStLNk9PQ0s4dUZnTzEvYWhQZ0E3VERVMmFKdzdl?=
 =?utf-8?B?S3ZYZExHYzNNeVg5dnFLVHRwWUgwOXVNY0NKVjNlelp3Uk9WRVF2K2VlU3ZM?=
 =?utf-8?B?YXVDWFpXWTVGT3RlaEVMK3RnRDhFUUxIejNZbGpua0E5V2ZjMVJ1UDlDdEdM?=
 =?utf-8?B?MDU3RmIrRFFyRjloWDlETW1leDByRzlTaVRLUGJJRjQvNHNRNS9Pb3ZMRzg4?=
 =?utf-8?Q?Oz6raOTKllqXTelaaIBjUqgoyx3loTrHRXbHBA1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbb968d-bd80-4898-222c-08d9034d837c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 16:09:30.4890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXLodjNMp8nRtOYarSitULwq5upt34ZIvwv8XzCHpDuozgFgwR+1rfl5kYRK6Dq6j8RKATxhCEfsoHaWgdZVvup2Ofxy660PS1XXToHcYtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4211
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9959
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 spamscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104190109
X-Proofpoint-GUID: 95bPIVsDryyl1JOMkH-b3MX5jB3CuQYx
X-Proofpoint-ORIG-GUID: 95bPIVsDryyl1JOMkH-b3MX5jB3CuQYx
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9959
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104190109
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/chown: Rewrite chown/chown03.c with
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

On 19.04.2021 04:34, Xie Ziyao wrote:
> For this:
>   testcases/kernel/syscalls/chown/chown03.c
> 
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
> ---
> v2->v3:
> 1. Remove some unnecessary comments and incorrect output prints;
> 2. Moved some prerequisite codes from the setup() function to the run() function
> and add code logic for checking whether the setting is successful.
> 

Hi Ziyao,

>  testcases/kernel/syscalls/chown/chown03.c | 241 +++++++---------------
>  1 file changed, 70 insertions(+), 171 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/chown/chown03.c b/testcases/kernel/syscalls/chown/chown03.c
> index 2c7bcfe7d..4469f1c4d 100644
> --- a/testcases/kernel/syscalls/chown/chown03.c
> +++ b/testcases/kernel/syscalls/chown/chown03.c
> @@ -1,72 +1,18 @@

...
> -int TST_TOTAL = 1;		/* Total number of test conditions */
> -char nobody_uid[] = "nobody";
>  struct passwd *ltpuser;

static struct passwd *ltpuser;

> 
> -void setup();			/* setup function for the test */
> -void cleanup();			/* cleanup function for the test */
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
...
> +    SAFE_SETEUID(0);
> +    SAFE_CHOWN(FILENAME, -1, 0);
> +    SAFE_CHMOD(FILENAME, NEW_PERMS);
> +    SAFE_SETEUID(ltpuser->pw_uid);
> +
> +    uid_t uid;
> +    gid_t gid;
> +    UID16_CHECK((uid = geteuid()), "chown");
> +    GID16_CHECK((gid = getegid()), "chown");
> +
> +    struct stat stat_buf;
> +    SAFE_STAT(FILENAME, &stat_buf);
> +    if (stat_buf.st_uid != uid || stat_buf.st_gid != 0)
> +        tst_res(TFAIL, "%s: Incorrect ownership"
> +                       "set to %d %d, Expected %d %d",
> +                FILENAME, stat_buf.st_uid,
> +                stat_buf.st_gid, uid, 0);
> +
> +    TST_EXP_PASS(CHOWN(FILENAME, -1, gid), "chown(%s,%d,%d)",
> +                 FILENAME, -1, gid);
> +
> +    SAFE_STAT(FILENAME, &stat_buf);
> +    if (stat_buf.st_uid != uid || stat_buf.st_gid != gid)
> +        tst_res(TFAIL, "%s: Incorrect ownership"
> +                       "set to %d %d, Expected %d %d",
> +                FILENAME, stat_buf.st_uid,
> +                stat_buf.st_gid, uid, gid);

There are two similar owner checks now, it would be better to
move them to a single function, something like this:

static void check_owner(struct stat *s, uid_t exp_uid, gid_t exp_gid)
{
        if (s->st_uid != exp_uid || s->st_gid != exp_gid) {
                tst_res(TFAIL, "%s: wrong owner set to %d %d, expected %d %d",
                        FILENAME, s->st_uid, s->st_gid, exp_uid, exp_gid);
        } else {
                tst_res(TPASS, "%s: expected owner set %d %d",
                        FILENAME, exp_uid, exp_gid);
        }
}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
