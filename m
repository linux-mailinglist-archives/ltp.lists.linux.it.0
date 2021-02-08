Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CEB3132B5
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 13:49:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D8BA3C6997
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 13:49:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B53653C0EC2
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 13:49:26 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B09CE100065F
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 13:49:25 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118Chc3S028595;
 Mon, 8 Feb 2021 12:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1fY4yZRVVYyARwQUtj4ElHdUyevKGVFONGtDjl2pU4I=;
 b=gQA/g3YiXACMaZQF+M2LLyZBEa7phUBNHDO2MAjVgpH97y3w6rneYGA0pKM8gfn0lxn4
 dNlrssroCqOjVjfhbXh6MzeD0FBiqasYg4Zw6jG+/AJOgPbeCck1zapAP29w1jDYWDDB
 aHLypWjjbLRQI5/YQJOIDXH02GMQVjdzl2Fjhp14oRadEvPwSe55OVJ4sW91h72RI7g1
 IPslY6G+JoR5+vIly7/7qmvKFXtjgkgNmYAU1kzrL9bN/8L058XuZC+CFQ4aUslENu1k
 i/vTApKFv3/T0Ea3SXd/DYZtJEJ6Uqe+HdYRwhGaP2sGf3HhG5hG7hx8RIWXR7l9czJg xQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 36hkrmuppe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 12:49:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118CjK2s027248;
 Mon, 8 Feb 2021 12:49:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3020.oracle.com with ESMTP id 36j50yr6kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 12:49:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBST4rPaE1EmtYPS1DUZqy/SyvBXrmWzZgUfy3qkwqdpPOpNLBaLgP+Y7zEhInuwx/uDAJdY362kv3YCturOnKuIpCEIYYCUSVNRjvW0deAYNnwEuIeoA7Se8UFDhBKh0DGlN01Fb9luXo7HEFsYJpMs9r8bPr0e585ZztIp+vIz5Tg0tBNIgcJXaSYfm25J7VcusEr4EfUteuZngh6ubXhGAzhEkLhZSdHMOHAaKNg+nDsr1WjxCJXzvsnBIyyiewROClXoXsvqieeer65Go2iKRfHxwEQ+bVL7DwX5iWT9QGqKEV9eoezDiJRk7LC7RDdeSbl8MDsNfHSs82EfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fY4yZRVVYyARwQUtj4ElHdUyevKGVFONGtDjl2pU4I=;
 b=TVJ1OiDmIsZKNdDS5wm2H0FEAYZZzkc/JmHWYoKimPQIfdwoyluLfY8yXC7hBReoIrY9on3VRnobbJ/C4v8JGb9fcWxZaN8Y6wYOHXbOsKCs7IWoYK71WDmbmIKlGN4v3CmWp7Pv1qZCfbaWA3rqr4qh0oS+HcvmlwMS+ZVmhFniTbirZJZ59hOgWJQJrX+oDjIntfNhQ0txJMf2jqcqFC4D1eWO2OhYrvOnRGQR08pVMIoH9HNAxw7+Wij8DZg18TrCE1/GOAhzwTA0LCKkFL9Th7hjs/3cc6CBbukuYrC0THkGB/uc11uKCvTjZ6cI2yVzbgq3iqrCHL6U4hxYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fY4yZRVVYyARwQUtj4ElHdUyevKGVFONGtDjl2pU4I=;
 b=araYMaPfAnOKzxT/+E+pHWiVzR+XNgrtn87/l0OmYlm/xxT+q7GeJWawwMsQio+qACCUd79BaEB6+P2fN+ZMiR70F9gOG3+2ezEytzWlTZtVmo/X/E3W2SiANP8OnWxtwSdJGnhe1ifCCkfdbjlXJlvJl17gBumVNM9YLjfVlwY=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3080.namprd10.prod.outlook.com (2603:10b6:a03:87::13)
 by BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27; Mon, 8 Feb
 2021 12:49:17 +0000
Received: from BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2]) by BYAPR10MB3080.namprd10.prod.outlook.com
 ([fe80::71bd:d013:6c98:9bd2%5]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 12:49:17 +0000
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210205142051.32055-1-pvorel@suse.cz>
 <20210205142051.32055-2-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <c5322d13-c69d-aa4d-193c-7c047a405d9a@oracle.com>
Date: Mon, 8 Feb 2021 15:49:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210205142051.32055-2-pvorel@suse.cz>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM0PR04CA0101.eurprd04.prod.outlook.com
 (2603:10a6:208:be::42) To BYAPR10MB3080.namprd10.prod.outlook.com
 (2603:10b6:a03:87::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.35] (95.161.221.177) by
 AM0PR04CA0101.eurprd04.prod.outlook.com (2603:10a6:208:be::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 12:49:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9ab033c-0e19-4f80-c2ce-08d8cc2ff221
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:
X-Microsoft-Antispam-PRVS: <BY5PR10MB4196A012BBE4BA51D7B69118FD8F9@BY5PR10MB4196.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1FfXpAr2PItm0HzuG5EcnbtAkJwOycmPq8Am+bHndcVia9nJrIzgEtWUaUinLRx6jdBA8em5PF4gaK6723jnKsIlM/53oekcSb1jYbBIE+wzEFaAHsihKI4IZkgnAUjxZ06lzp4IYvMGCiv5OkNl0KMi3UQOIy18vrU5bnxnm8r/riTLCAapYoVoZffvPUOXCeKthWjfoWyDmIcYYOulXbCSe58uv8HG3mqxsqKAkCrB8+huJLS2hwv4C1nisrv0WNAM2kteJpOgxtyFwP/XOgq/wjcvdNo3+sXZHZ64T8K0mw802Kadv1UYRr8qvu1oTqrZrlphfHKoMbiX+3QH4BxFJi+BvTnmL9iJCLnWjyp+Y3/S4AsKOtWl60ke21slPY7dC6riTURNekYz28gtu+JezKtL99uibg6vd9bGbip5j5c42V97WbCD7D8sfdr72DNZri3V9NZTNQzXLQFy6gGgFXDeaJjenp9UoUaW0eknSm2SZ/aO1Jx72JPxInjALpshartIM+SCxfG5wLPtyTImc+jtKDSH//zLn9rBNFtdeJnhaov3s+xrRjtjF9Z7+K6PWkSQgjdgYjB6QjHPGsnv3tIWOPlSLHXF85JNI58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3080.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(31686004)(956004)(31696002)(66476007)(2616005)(6486002)(53546011)(26005)(186003)(8936002)(86362001)(16526019)(2906002)(6666004)(8676002)(36756003)(83380400001)(5660300002)(66946007)(66556008)(16576012)(316002)(478600001)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUJwYVYyVFdaVDRoWCtsd0w5a2NQZnpWbzFjeThMS05mZzBoZ0d3VDNCSkM4?=
 =?utf-8?B?NkpjcS8yekNoZmVHY2ZxajhDdWtveVVFdE9SSXIwdDVISzU4UFFpMDQ4cmw5?=
 =?utf-8?B?akJqQzBTOGpJOXY2R083NG03SUVLNkhZVytEV1NuNm14UUk2UGI5dThZbWRU?=
 =?utf-8?B?dUZOZHFuQ21PTklFU0tGSFpqRDZ5MGh5RDVWdmNZV3k3elB0MzkrWWVjM1pT?=
 =?utf-8?B?S2pQY3ZnYWRtYUwrMFZ0L0Irb0dOVzBYbWJ4b1YxbnpRdDEwM09pN0NBc21T?=
 =?utf-8?B?MXArZXMrUlB0RjRhZU93dUkyRTVZWGNQbEEvdE1UcXc4WXNTU2s0bnlzcmZ2?=
 =?utf-8?B?aWF4RGlDYkprZGk3UTNmVmFzMXhCL0EyV3lsbGxac0ZicmRpclpVZWNkSFpt?=
 =?utf-8?B?a0paSXRQQ2ZEZ1daQUUrdXFNeS9lVWxtREhqYkxZN3RxakJtOFY1bk03bFVn?=
 =?utf-8?B?M3NkVkJEVzY4YVFTbXozWlJ0c2JzblpHMTAwWEdMTk1ENUFia0lxRjhqS24r?=
 =?utf-8?B?WFhIOTVzalNQdndndXJ1TC9ZRFdqM1F0SG8ya2hQK1poTDY5bWRBcnVxKzFt?=
 =?utf-8?B?Tnl6RmNmVG5Db3BSYkN3VG1CYUdpamFOY3FneUt0UmNGTjU4TWpSSTVKdG9O?=
 =?utf-8?B?VHhXeHZIb0cyS3pqTVVxWGVhOURiYjA2WENqd2FwNFJZSllZalJEN1ExWUNM?=
 =?utf-8?B?OUYrYnVMYTB5NlBNVW9XWlRyZUlCb3hqZldOZ2E1bFpJdEZvZmZMT3pYdkVY?=
 =?utf-8?B?SVZlUGRhMHpwS0pmR2NtQm55VXg4VmdySjBsT0JyYTc5bzFid3o0OU05aDMx?=
 =?utf-8?B?SWdydUJkYTZIZGtzQTZsV0dGRnBpeFFiYW5tV1RrN1dxbmRZOFZueFo4Tkp6?=
 =?utf-8?B?SnRYWVE3Szg2eWEvMXZabVNTMDdTS25PditJa2FrMEVtdkJJZlkreFJub2kw?=
 =?utf-8?B?dFpDSUNhQjZDcGNsTWhWU1d2ZFRGYzhpRjRCK0JEcTVnbEYwN2E5NjBMbFh4?=
 =?utf-8?B?TUpIZ3JVYS9ZczVRbDNneFozVHNOOTNWWGlCcmlYSGpjOXBtbUFZZHNhbkg5?=
 =?utf-8?B?MFNFSDFPMHhlYVV1Sy9DWUhWOGRmTGYyZlkvOUlmS3h3bnA3Ly9HU20ySXBh?=
 =?utf-8?B?blJlUGN6eUNsZFJxTVV5cFBzdmdDck8wVTd1SGxyZWZINmRobkExRFU0YVMz?=
 =?utf-8?B?ZlRHOFZxaUhsd0Rrb1NQd2toalN0QmZQcHduQ1Y0bmZ1V2J5R0tsTFNxMHpl?=
 =?utf-8?B?SCtmZjc5S3VhNXFqdHkvQS9yRHlBMlpab2F3dFl1dFlSNjduSFpTZml6QUtF?=
 =?utf-8?B?ZEdoeE1tc1FvSTVHT0pLVncrNm5MMFhZdTBKNGVlNlFYVldBRDBIaTd4Vmx6?=
 =?utf-8?B?RkZVQ3o0M2REM1h2SkJWUnZoc3dHQW82cU5jc3l2Wk5udW1oTDZja0JSbFVR?=
 =?utf-8?B?Rm9YemM0Y09Bd1IrcUttME1MMTVzeHJCd2pvMmZvQ2N3N2hrQTBZRzR1RlFS?=
 =?utf-8?B?RGIrUGc1aU43RXMxUXp6T21tbUxBdEZVOUw2REkwMWJpS3BVZk1JOFp0bUQ3?=
 =?utf-8?B?eUtQN1dBMmlPcjhLdmpGYjZtYWYvaFJ3S1E4YzVtckhPYjc1ZGJTL2E2dDNy?=
 =?utf-8?B?ZjBzR1JvNUVWdVU1T2hpMWExZm1Lb3lQdVlkTEVXT243bUhVaGVzQ1drcGhH?=
 =?utf-8?B?eXg0Tlg1cFBhdm5WbHJCT2hZaGZwQTQ4MG41VVd4Vjl4MjFuNGZUYmEwWUNR?=
 =?utf-8?Q?dOndkX5Sf1tR7O4fnBgT/Y7X6t1pHByoZRLvBWV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ab033c-0e19-4f80-c2ce-08d8cc2ff221
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3080.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 12:49:17.2262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiFaRCGDF6gZcjPIYWtqA0Hp6YfjSOfkUJczbMpTLM3S3sIJxWAH+cBbmPGWNLD+ZWoRx+FxoLz8SLQUwYEXQhjzvhjZ5KSOKP//CSeol4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4196
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9888
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080086
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9888
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080086
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] if-mtu-change.sh: Lower CHANGE_INTERVAL for
 netns
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

On 05.02.2021 17:20, Petr Vorel wrote:
> to make testing faster.
> 
> NOTE: the default sleep 5s is needed for ssh based testing to prevent
> link-flap errors on the switch. It can be lower down by user.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  .../network/stress/interface/if-mtu-change.sh      | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
> index d2816606b..49ac5e3fc 100755
> --- a/testcases/network/stress/interface/if-mtu-change.sh
> +++ b/testcases/network/stress/interface/if-mtu-change.sh
> @@ -1,6 +1,6 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2017-2019 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2017-2021 Petr Vorel <pvorel@suse.cz>
>  # Copyright (c) 2015-2017 Oracle and/or its affiliates. All Rights Reserved.
>  # Copyright (c) International Business Machines  Corp., 2005
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
> @@ -12,9 +12,13 @@ TST_CLEANUP="do_cleanup"
>  
>  # The interval of the mtu change [second]
>  CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
> -
>  TST_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))
>  
> +if tst_net_use_netns; then
> +	CHANGE_INTERVAL="100ms"

Hi Petr,

What about adding the option to change this value too for netns,
for example like this:

TST_TIMEOUT=1
if tst_net_use_netns; then
    CHANGE_INTERVAL=${CHANGE_INTERVAL:-100ms}
else
    CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
    tst_is_int $CHANGE_INTERVAL && TST_TIMEOUT=$CHANGE_INTERVAL
fi

TST_TIMEOUT=$(((TST_TIMEOUT + 30) * MTU_CHANGE_TIMES))


> +	TST_TIMEOUT=$((30 * MTU_CHANGE_TIMES))
> +fi
> +
>  # The array of the value which MTU is changed into sequentially
>  # 552 - net.ipv4.route.min_pmtu
>  CHANGE_VALUES="784 1142 552 1500 552 1500 552 748 552 1142 1500"
> @@ -65,6 +69,7 @@ find_ipv4_max_packet_size()
>  
>  do_setup()
>  {
> +

empty new line?

>  	[ "$TST_IPV6" ] && CHANGE_VALUES=$CHANGE6_VALUES
>  	if_setup
>  	saved_mtu="$(cat /sys/class/net/$(tst_iface)/mtu)"
> @@ -83,9 +88,10 @@ do_cleanup()
>  test_body()
>  {
>  	local cmd="$CMD"
> +	local msg="'$cmd' changes MTU $MTU_CHANGE_TIMES times every $CHANGE_INTERVAL"
>  
> -	tst_res TINFO "'$cmd' changes MTU $MTU_CHANGE_TIMES times" \
> -	               "every $CHANGE_INTERVAL seconds"
> +	tst_is_int $CHANGE_INTERVAL && msg="$msg seconds"
> +	tst_res TINFO "$msg"
>  
>  	mtu_array_len=$(echo $CHANGE_VALUES | wc -w)
>  	local cnt=0
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
