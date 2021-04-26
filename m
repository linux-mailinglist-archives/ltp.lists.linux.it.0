Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C036B5C5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 17:28:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 63BB63C6765
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 17:28:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54EB23C27BB
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 17:28:08 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 40FFB1A005F4
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 17:28:07 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13QFFVwm046729;
 Mon, 26 Apr 2021 15:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=//UnPttr+wBGqMWc9SU0Q/jnO6j9zmTNxXax0r79L40=;
 b=SXk0rRkfs0ZaoXfr4jsPsuqSS53b5T5RXi6mW3XX6xrXZV/VEH7oovvoUFBheKLHcS2S
 Z83sy2mRErD2Pkj6icP+3nNFFA1dK9E2bCa8DsCppM5SCIwU6t54Z5wzusA/mHTKUGZ3
 IGhnBHNwO3Oa2Ft0BGMR5frjYuT+nY61oAN0owahOlwYEjrfvLbuyK+qHNP0yv/Da39Z
 WS00ClMJvSWNPLpxGQQ9iY5faNHWlmXL6clLFuWUe5vwnFxY8PvwLw+uxpgTlog/n0AJ
 LQdG2uIMMLXI9UZGMWbJouwKFCG6+U/3wyWiPXDg5oew9Qcea5jX/i08R8uc7QpDNKJW DA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 385aeptf2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 15:28:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13QFBlps099854;
 Mon, 26 Apr 2021 15:28:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by aserp3020.oracle.com with ESMTP id 384b54um51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 15:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE1Qnx4IVmZS3w8DaQI0W+HR4mLtmv7M1GAw1ScIjrsrG6X0zL8U8lcIpA3ysHpEMvxbVsaq46lXCOIbx+Am3OozXuqWJUcFZxVTCwMH4EbJzT8Ea+82n2X2iT1huFPfbivWVCrtCT212TdtUe6sjfHSR8+58Z02DUL3VulruKingAAZ/bgXM9i+AxmTaTvYp7dju3qRoqjlRQnlRgPWfPjJUxz4EKi6fz6aZ7m/rbOi0mHDB5Dage7Wf8RYIqbR2tPv80If9rG3CZeVHpFfSmETK/CWoaFvJ+MC4xap1j0VYif8D30uu74g+iFXFV2jF9GXVk29/gN8NF3kH2YYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//UnPttr+wBGqMWc9SU0Q/jnO6j9zmTNxXax0r79L40=;
 b=Ce8LhVjBmtINlo5gFec2+WYh2lrm7WWkIcrZBzWrXfnV3YlDy77SCAhvbFIw4nezCutKoDt+dqAu7phZXfXuABXvPluLHzaeZMXO0RdDu0mq0wbKlVms/Kk+5D3zs9PkmMs06u5HZey/mmLQZ/2+W4ZHjyHzMFuqNmS8xGFFLuIirSQeftDahybEn72uyMS9Z52hFL4v30QlbGUPALl0y9RQmmSObBieU1cW0EaGeUQzt0Xfp6SYR9YMuMpe2lGaXz/v2LMQJBcidHxzz+QFuqM3Z7J0NZDSVLKqnHf4jjigXrYewGq/vWM8E8d5nDH4ckvm4q5bV4cSnn6ZGWbcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//UnPttr+wBGqMWc9SU0Q/jnO6j9zmTNxXax0r79L40=;
 b=ynWKfyeGQKE7F258e9jVkWkOdvWZKaFF4YV0qosFMJB54tTXcCk02a29GIBV7JwRyN+syT6pzpK0atPFQhPNBJc/M+bTC+zXAWN0a9v0x0buOZGxTTqNR1RmlloAj2fw3BxeXOdcUE+CmwnWEH030I1NlSoQ7y+mMsNlUNZHQ80=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by BYAPR10MB3494.namprd10.prod.outlook.com (2603:10b6:a03:11d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 15:28:02 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 15:28:02 +0000
To: Petr Vorel <pvorel@suse.cz>
References: <20210422131630.28565-1-alexey.kodanev@oracle.com>
 <YIZbfLBS7C5hUu++@pevik> <d7f5805b-318f-d1f2-84ed-c2fe0769b854@oracle.com>
 <YIaxyECJfyzuv4eS@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <6257020e-faaa-cdd5-0e6f-498ad5c840cf@oracle.com>
Date: Mon, 26 Apr 2021 18:27:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIaxyECJfyzuv4eS@pevik>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.51] (95.161.221.177) by
 FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.19 via Frontend Transport; Mon, 26 Apr 2021 15:28:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6ec4c97-acb2-4e54-75ad-08d908c7e13f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3494:
X-Microsoft-Antispam-PRVS: <BYAPR10MB3494771FB0870DA5E8335703FD429@BYAPR10MB3494.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgaOg8ticBqEYk0LTNcno6biwKwA9hmYwVzAFtz0fr0P4Eqalzbdlt2OnWmMyhr+g/Qbog5ESR+WxbouS6FXghgfyOcj0nz/NwS9Jbx/LQGQ9ujZm8rXJKGXriZWnYgPCcgo3OTmUHWpj7QwHLEvcvKAMPZPTqooEUuNa4/4L6Itlzn30sG9uEBKN4DgD2idJ/7O5DYOlKMIf/jPJxPmu1RKq6Pgl/5LauH/TvancGMuaJYrroEf6Jnf/KYhVISvvi8DNQQtTplqJZOWHiL8/+x2KuNPsuQmwibyZnsdWO+H+Fcu4CKZY1puEcrIMODATojarZwLmYPjgTwghRpyBd0FBclBmnb4ue2AiOfLL0p9RYFE4FC6+t/6nx7sYxujHcP+5WNHAI0YSxBzMku1Aj67yucB3+2FgDDhJMHbWN+pWk04tzFdR+yMfVpm2CPOuCxA3j2B++8X/RGjWrX1TWuc6pfidA9PmYyicPOCZMMmQwGOJt9ZfnsB8WBcKzw1s7jXPI3DB8G7uQFRxt0u6OVF15mNLVR6fXK9oQbt4N0xuVS4YYwbyFRO5EIBDrwZbZAmBjcndTAOMqPcGHa+eBniA6TeiOBHj8tng6733ttZfwqrw9ETDm9kLlGm4AFF8HqQ+k2vXZUZklOV63nWHel9NBR65/5DKN/MLMrcxXBSVm1q0FYPGHHI0LOj/Vmx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(376002)(136003)(366004)(186003)(66946007)(44832011)(16526019)(316002)(26005)(38100700002)(6486002)(66556008)(53546011)(6666004)(5660300002)(66476007)(16576012)(4744005)(86362001)(36756003)(478600001)(956004)(2906002)(8676002)(4326008)(8936002)(31686004)(6916009)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aERkMWMrb042c3hubkx5a2VqSGl3Q1BINTZYZk5nKzByMUVGekJLeS9vczBG?=
 =?utf-8?B?SFVkWSs0a0lKbDM1R21iU0NucTU4Mmc3b2gxOS8xdEVVWkU3TnU1ZTFZYUFH?=
 =?utf-8?B?ZHlvSG4xMzFyUUVDK3kyM0lzblUwdHE2cVlPR1lsbHRlZ2UydS9uVU40TUsz?=
 =?utf-8?B?KzdtZ2FpUERqck0xRE91M3g0T283ZXFlOEpFY2lTYTJTcENrUWJ6dGFzaG1J?=
 =?utf-8?B?SUJERUdrWWpNY3A1U2VyM3dEZGZHRmhLVVZ5TmFWV2JkSW1sbjJxM2p3T0c2?=
 =?utf-8?B?ZnFGdFdqUFNCaWVNTHQ2SkhtTXAxQWY2TjVWb1dlWjh5T2FBa3ZmSy9FSHVJ?=
 =?utf-8?B?Z09wSk1DV3dVRExOUnk2aTM0K1JwdkZmRGlmcU5ReFQ4VWsvRU16bE82K2RE?=
 =?utf-8?B?bHU2RW1Hd0kzcUh6eUxaOHlVeGV4VE9HakU5YnZzMEpvY01VWEVPb1ZUSlNV?=
 =?utf-8?B?blBqbDlMckduaVR1VXhwTkhlTFhrdGtPdDF5VW5lVWZvOUhqeitMbGY5Z2Uz?=
 =?utf-8?B?T3g1MEIzS1J2Ukg4WE1kbFo1bEV3ZmE1WEg1QXFYNVpoN05rKzZoYytnMXNp?=
 =?utf-8?B?ZGpzMTBrQzdkOUZBNExNS201UW5ZOFdrVzd3OTVqa1N0Nys2dEg1dXR4R3Iv?=
 =?utf-8?B?WTIvYVFCRUxsNXNTZ0NXc1RkM2VoVmFkb3VnZWhhMWNxNmVsVnU0K0pTQ055?=
 =?utf-8?B?Sy9zQi8vQ3FIdXQ1akZERlNUYmFMRzRTcGVkVlhGaVU3L2RseFlOQ1FFWkxW?=
 =?utf-8?B?UGdkQjJiYkZ3MzQxRWlPaVVCT041eHhHZHZrVHJlSVoxMStINmc4Tldhenl5?=
 =?utf-8?B?aE5qYUJOTkRBMytUaUpsdTlveFN3d1N6cmFDLzRFSXlsSEk2TTlac29pbmxD?=
 =?utf-8?B?dVBseVJtWDM4Q1lBSjI4bTVHQlNhem5UNzg1MlU5SzFZcEYwc1dEMlJkdU11?=
 =?utf-8?B?b2UxSmpvb0FqWnJJMXJzVnAwb28vWk1FZklKd1ZMN1Q4akcxcGRoYmwra3F0?=
 =?utf-8?B?ZzdlT09HL2JCdnppMzF2ZUVOOFRWMDJKSWhvWk1kOTVJeWMyV1JYakhkU0p2?=
 =?utf-8?B?aGc2S1NZQThYOG9YZzJFRVBENjRENW1EaFUyQ2lDenl3RE1TK3ZuODdsQitr?=
 =?utf-8?B?SlFvK0xjSzR4ZkdjUm1uYmxTVXhzMzFKZ2JTY0NDZnQwNkpETEhNaGlTVUQx?=
 =?utf-8?B?M3p5MXZZdnFTR29OOGFzVnRDZitaOUxxSExaanJ2VVNBSnc0bjB4L1VsVnQw?=
 =?utf-8?B?c2hpMGQzdnpyUTlFQnMrN012TUxEZlNuMlVWWFBHT0VWYWp5SktSMGVYdjlh?=
 =?utf-8?B?QUdhMEFzTXhhaXdaYWtxbm5jQ0JPNjM1dGNCcDdmQkFVRnhVR3U1MmJQZU9R?=
 =?utf-8?B?Wit0REx4dEw2VG1ZTWlqcFMvYXE4VmFDUGhXd3ZCNEt1R1lJTGFiRVdJNWdU?=
 =?utf-8?B?c0JXOU02Um5RZFFjVGpHTTdpSW1nSThSMG1jVlpYSDNVYWUyMjVuZWFjaWdO?=
 =?utf-8?B?VFBGNmFEN0hZRmQzdXV2N24rWHBQbEVTK3R1emdkTE9JdVErVURYUHEySE1j?=
 =?utf-8?B?bDhvYkgzWXMycFFjdG9KUDVDSG90UHBqWkZwQTFtYzJicnhUaitSbTZlTS9B?=
 =?utf-8?B?NFoxU3RzdTNlK1pXbjFGZG1vRjVrWGUyY2pMdTZQTEl3NGc0dzZ6TXJ6R1pk?=
 =?utf-8?B?bHhHNHZRRDI3NWRzUGpRdG55WXRBTUh6NE5obVc1ZUlRcCtwbFRJYUxqMUsv?=
 =?utf-8?Q?xuAJDG4PdUzsXXyNMaxuCmn3Xok8WeiMHsLzCfa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ec4c97-acb2-4e54-75ad-08d908c7e13f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 15:28:02.2011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IcsrCNsgPkDwN86e7sYqT/WUmk3eJUWcyEURmTEN2uFI5ssfD6bWIupnUIn6X/FCbpO2XxXwPd6zsnf1kzBYHeroN4cr+xBtSO1DAfKrlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3494
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9966
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104260120
X-Proofpoint-ORIG-GUID: VOocjfbEs1h3sJpfcP1BWTJiUvb_4it8
X-Proofpoint-GUID: VOocjfbEs1h3sJpfcP1BWTJiUvb_4it8
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9966
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260120
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] network/virt: new FOU and GUE tests
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

On 26.04.2021 15:27, Petr Vorel wrote:
> Hi Alexey,
> 
>> Hi Petr,
> 
>> Thanks for the review! I think with test args we could reduce
>> duplication without complicating too much... what about these
>> diffs below (gue01.sh removed)?
> 
> Good idea, thanks for addressing it, LGTM!
> 

Applied, thanks Petr!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
