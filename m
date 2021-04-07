Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D456535733B
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 19:33:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2BCF3C739C
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 19:33:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54FFF3C1DD9
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 19:33:28 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A63031000BDB
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 19:33:26 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 137HPOgB093185;
 Wed, 7 Apr 2021 17:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=EKmN9Z5M8qd53Be/1rzuHCScDvMXp6kYvyvv1yXdq3U=;
 b=E0ld8Ne80vnG+Zys1abXJ1U009UlZXCpNkk+jlk/7LLKKu/41ECHPJ0xqmHXru5dv0zi
 i5oPkOIsDLRSQMfnwNUSrxdjBNKGf5oCUFO2hw59W3mANr2KoDVZOc76ZDN/CXnx3aIl
 cutbZQ38EgkfB2gqEkQ5rELoPsg7X9x+FrmG5yszstKOljm3o6ltsM2WZKLatJ4qdOyw
 hNQv0BgB9sFOl8V0PfeB1U+xgZjXccjd2VWlqzSCPALt08GHeuid3mAgEjp+FCELQ4VM
 dTPA+lL81kYq8GsUENuLzxoliu+mJ81UW5kc4m/AvGNmgGiwQDa7E1/BG3TdPiTpLlUw og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37rvaw3cy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Apr 2021 17:33:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 137HV7dd122062;
 Wed, 7 Apr 2021 17:33:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by userp3020.oracle.com with ESMTP id 37rvb065u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Apr 2021 17:33:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC7ZAxhg21VwltQT3JwESfsGjmEOuc+7rUrzlusOWYvxbJk5atmJT33EOV3W+vO4OLGlqSg29DSp3wjVRoS6vrknxMdCp2O0RtA3i4LJJJGQX17Tt7mtRReypAV6X7DWFbxk3ORSs9dPMFDQ7ShfrfluUXshgH//nywK432J7dVq9qYNCol1aVu9Chhr4YDaT81lZ8xC2GnXIlSmsn64R+OjAmqWkv6ZgwaBGGnOqIQmR0qtkajvOU2h177s9EL5LpqagU+mlOlXJxqckdJHGpvld84sPOEXh3nMzm2al0YC2yiUfGayfcy6doGlblwdi9PCPfAtU0m+6qbfzTnJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKmN9Z5M8qd53Be/1rzuHCScDvMXp6kYvyvv1yXdq3U=;
 b=ZTLjZrUEqHGIKGJxn3i85XjcbHQEIj5nDCSbgPNkldDGuuI70/nHP0h45xeq0wJhmDGsYp1iepbxenhlWoly5Aw8+oKAP8YtuLRxbTVBcwrtf/C/T/1NRgvNeU8A9Z774vrciwCn9AH5roHuTQ3rA+VyX/5XsgyRy1VUn4HG3lL7IV2CtTDY08cSFF/tjmoeH417uE6pbWiCrlbpHu5EKLcdh5GnXlz+F9IQk11nLyUFPcP8Ta7uSHmRGXMoyBaJF1BY7yFgfdMcIu6Ofn3HgiY++QAyIW3a1fbqw6VwEgDeqKSrqf5b7jx/Q29Vp8osz53xf4BfAQ2ppYk/6ErfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKmN9Z5M8qd53Be/1rzuHCScDvMXp6kYvyvv1yXdq3U=;
 b=FF4KafUVVKDBvmGtawr7ocD0JBswcKfDdlOFS/0ZwVrB+FxctAixVlDq7Msifx2jD9RXf2Wi1AYfwldIfHbmgRblPXly5Wqt8rNpto4luzVuUIMMQFnGH+hKIAtL/HOJNN0dy7tjuRWPIaGxTwbp/EQcEDNfNBcIb0esYbYKJNI=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by BY5PR10MB3906.namprd10.prod.outlook.com (2603:10b6:a03:1f7::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 7 Apr
 2021 17:33:17 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 17:33:17 +0000
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1616497037-19158-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
Date: Wed, 7 Apr 2021 20:33:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <1616497037-19158-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM4P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::33) To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.52] (95.161.221.177) by
 AM4P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 17:33:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6339666-236a-4900-b57f-08d8f9eb3aa2
X-MS-TrafficTypeDiagnostic: BY5PR10MB3906:
X-Microsoft-Antispam-PRVS: <BY5PR10MB3906CABFAFDD02437FE9DEBCFD759@BY5PR10MB3906.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wd56XV1fw+PsdstmcR/AJk+xGt4MgXYQVJ1gW0cOpoQmRLAelT4ZJetJgTODqIxCQjMWf5LI5fwuW+xFOirv6V4+5g1fUbOmV6xJ/C7mndBb3OLoii1mJWgOkGvugS7HuaIDZph2nEQ0vFy+nKtpiUveClPgQx8UwSIoAwsoMWt4YEjLLS2NdbW79Bkz/ek/SZgXNfUdh0ceKy64lDrNKT3aIcQ4SsREOcWIWMHtnr8fPbQcOZC5ksGiqCU7X9oYRuL0wfLBaNFKV5hQATf76/jH7NmR69IjkcmhyRIxSVYWkuWJkVIUdaj5KEWDYn7W5jmgzgPeDPX/+AlbEwgHmVqUPxovuHC6xyXFZGZrwBeQVb9jwDsdYdwkvnuzmYuJM6wJfgolSbkj0rYoZZ+tfTOml3SmJjh/4P6ggHOru/YmsTF8+fK5xVlQaRw5mI55sLjzl2ZEjX8Eue9ZR7raDZEf6riY3s/nFC2euVZhHfPPO5tvpn83nS9HWRO4FKF34bDjvpD+j69s/MFIOn2s6IqaRR18wTNLga3jVA8K7213qZw1t9PwHT33s97Xrf0csOItoGNcW407gdF8BYCabSpfPAXj41wCN0IXo6z6vvolYTFsCijr/tMDAQBYKoOlh6VQt7MHUvEzLt//y/disaJe9qKNiZPjNNcRnf1FrKfW5GUgPFIwvDPqdp+fDNTeDA+Rm8HZpTTlv3oRoUTP6u4vdPOvIl5UG8veIstYMsUJaSp35CDUzbMG3JGHJAkT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(2906002)(16526019)(30864003)(38100700001)(186003)(86362001)(31686004)(83380400001)(2616005)(44832011)(36756003)(6666004)(8936002)(53546011)(66476007)(478600001)(26005)(316002)(66556008)(66946007)(8676002)(31696002)(16576012)(956004)(6486002)(5660300002)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnZHNWlqVjM5elkxZGp2cDgxYkJEZ2ZKMTZrSnFXUUhXN290dkRaYkVhSlZO?=
 =?utf-8?B?WjZQNlRHenZBclZMbnJ0bnJlVHlnNU11SWNuc244RlJoNmNZeCtta0VjdUVx?=
 =?utf-8?B?cGEvU3EvREhoNnV6SVMyRi9QaVkveXJhN1BrVDFZOFNUQng1dkxJVmF0bUli?=
 =?utf-8?B?WnZmWEh3MjZYVWtuaGlpZ24wUW90VndmckhkRTVtd0R6ZnFONElwZWZZZXU1?=
 =?utf-8?B?V082Zm9yUExiNkV4Wlcva0k0NkFkQzdkSTBnaEpLanNQVlJoVXdGNDhyYkFW?=
 =?utf-8?B?VjN0bHJDR0RERzlreXN3M3lMNUhYUC81Vm53Smk1ejV4cVJhOGVtNTNINytl?=
 =?utf-8?B?Q0RKY0QrZnJQMWQ2ZkhjTitBSXJSS2t0aGdSOG1CRUl4M3VDYU9KMm5ObU9W?=
 =?utf-8?B?RXJtUzNBWnpJak9jSU1kRW1LMmJrekFWZXY2bGZwQkMvNVRGdC9CY05kQzd3?=
 =?utf-8?B?NmZnMnkveTVscXcwckRwWW4vbEQ4UGhzaUJDMXVoUkd5Q0M4SVVMRGR1SUw4?=
 =?utf-8?B?VlRJd3d1Y0c4TEpYdU1uZzdwMVhBUHhmR1RUN1pyQVFLSWpNOURMV2RrNlZy?=
 =?utf-8?B?STh2R1g3SzVmb1RyU0xJNmtDaHdmM0JaUVd5ZlBaV3FtNmVjdmZ3OHpNbytL?=
 =?utf-8?B?d0RVRUVkV091aG12cy9WNEd4cUtMQm1hV0lUME5YeGtwQmVDS1hxMWlHMjMv?=
 =?utf-8?B?QndNTTd3cmhSOXZ2MzMyeEtFSkF5amNrZmdBNEdkNTJrTVhRNjlzMzdaS0sx?=
 =?utf-8?B?R0NRbHo1cFplbWZlUWphNTVHdlQ5YTdXSkZ0ekNoSXRUNHFHUjJWalh0MXZV?=
 =?utf-8?B?OHJzaUx0cUN6WENPeFZHc2ZyUVV5Q3crK1Q0Qko2WlJ6L3pXLzQrUjRmdGY3?=
 =?utf-8?B?SHhJT0tGMWJ5b09OZ2VLT2VqM200aHJWdTQ3VDI0WHRwekVwR0hNK3ZCUGxT?=
 =?utf-8?B?NFhjR25nQ3JJREZmL1ExdmRCVGtpRXhJZ1lXK0s4VjFTcDJxdWZFUjdHOFZK?=
 =?utf-8?B?YkVPSHppVnNiV2ZlZ1Q4djRWUW43Sm03RWVsQlNBVXZpbENEVzJXd25PS3pt?=
 =?utf-8?B?TXN3cEQrTDdCMEUyeXFySFBSL2hnTDViZ21XNUdkVzA4RFJlV3NIcUNOeGVK?=
 =?utf-8?B?Zzg4ZE52aXdrcm1nZGUwbHdPdmdoWXo0NlR4U0FERnVlVXhnZ2xhYVBDaHVw?=
 =?utf-8?B?WUppY2x2Zmg4MEJPWHBlbWFONUcwd1BET3FCcmZnelE3TThydDNrWWloZFdD?=
 =?utf-8?B?b2hoVmNlRklxaVlSR2JmZk51dHNSTitsbU04NHFEWGhmMTJ0Z2VHSVcrSkht?=
 =?utf-8?B?NlI0cGtPUndiajJEOGxrcFBISWhaN0MyMnZoYy9tdU56eEpoellXdFN0OUdX?=
 =?utf-8?B?MGowenVrSlBvU1V3UFg0Wkp6aENIUTBNY2s1L1NHcEV1ZXRxL0x5dXp5OXBa?=
 =?utf-8?B?alhHVDkxa3lYczZiMWg2K29mNHVXVnJRS1dtUUhyRGxQTHVMNjZmc05hNE9p?=
 =?utf-8?B?ZkdENndIUElCYXl5TG94NkN5d2prMEYyQ0d6SWVPOWIxWTZadlgxd2Y2VU5n?=
 =?utf-8?B?Zmxud2xJSVJEcVd5RjNVN0pJY1JzQzRBbGpTU2pKZk5CaEU5ZWdHOFhGVjdr?=
 =?utf-8?B?RThLYWNKT2x2QkRrUXgyZWtTTnRaRXFQRzZPQ1NrVGk0aGdhSFU4aXVQT1dD?=
 =?utf-8?B?OC90eXptTk5VT210MTFhK3pCQTlaczlLWHBNeXgzVHpIdW5Kc2VLbEswdmov?=
 =?utf-8?Q?S2PkccadEbKwjtvdTukg9F3buyt2sG0lI7TgXmd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6339666-236a-4900-b57f-08d8f9eb3aa2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 17:33:17.2366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+sxuD2izX5RwpuLfGHPo+/eeAJteQWQTIKOOlNgVUlh2emSyWW9ToxOUnMRb/b8JN19HbHToRT3cpE7sDXBB63423kQ97UInhre1b8PTt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3906
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070120
X-Proofpoint-ORIG-GUID: 8T_HcO9-krSaSxlB_NCLYANuiH71E1W3
X-Proofpoint-GUID: 8T_HcO9-krSaSxlB_NCLYANuiH71E1W3
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070119
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
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
> 1)Use SAFE MACRO
> 2)Remove useless macro and UCLINUX
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  testcases/kernel/syscalls/ipc/semctl/Makefile |   4 +-
>  .../kernel/syscalls/ipc/semctl/semctl01.c     | 528 +++++-------------
>  2 files changed, 149 insertions(+), 383 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
> index 7b7a11d62..8178d74ec 100644
> --- a/testcases/kernel/syscalls/ipc/semctl/Makefile
> +++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
> @@ -7,7 +7,7 @@ LTPLIBS = ltpipc ltpnewipc
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> -semctl01 semctl06: LTPLDLIBS = -lltpipc
> -semctl02 semctl03 semctl04 semctl05 semctl07 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
> +semctl06: LTPLDLIBS = -lltpipc
> +semctl01 semctl02 semctl03 semctl04 semctl05 semctl07 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl01.c b/testcases/kernel/syscalls/ipc/semctl/semctl01.c
> index 2f443db89..45e61c3b2 100644
> --- a/testcases/kernel/syscalls/ipc/semctl/semctl01.c
> +++ b/testcases/kernel/syscalls/ipc/semctl/semctl01.c
> @@ -1,59 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) International Business Machines  Corp., 2001
> - *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - * the GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program;  if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */
> -
> -/*
> - * NAME
> - *	semctl01.c
> - *
> - * DESCRIPTION
> - *	semctl01 - test the 13 possible semctl() commands
> - *
> - * ALGORITHM
> - *	create a semaphore set with read and alter permissions
> - *	loop if that option was specified
> - *	  loop through the test cases
> - *	    do any setup required for the test case
> - *	    make the semctl() call using the TEST() macro
> - *	    check the return code
> - *	      if failure, issue a FAIL message.
> - *	    otherwise,
> - *	      if doing functionality testing
> - *		call the appropriate test function
> - *		if correct,
> - *			issue a PASS message
> - *		otherwise
> - *			issue a FAIL message
> - *	call cleanup
> +/*\
> + * Test the 13 possible semctl() commands
>   */
> -
> -
> -#ifndef _GNU_SOURCE
>  #define _GNU_SOURCE
> -#endif
> -#include <sys/wait.h>
> -#include "ipcsem.h"
> -#include "safe_macros.h"
> -
> -char *TCID = "semctl01";
> -
> -static int sem_id_1 = -1;
> -static int sem_index;
> +#include <stdlib.h>
> +#include "tst_safe_sysv_ipc.h"
> +#include "tst_test.h"
> +#include "lapi/sem.h"
> +#include "libnewipc.h"
>  
> +#define INCVAL 2
> +#define NEWMODE 066
> +#define NCHILD  5
> +#define SEMUN_CAST (union semun)
>  /*
>   * These are the various setup and check functions for the 10 different
>   * commands that are available for the semctl() call.
> @@ -67,363 +29,171 @@ static void func_gval(int);
>  static void sall_setup(void), func_sall(void);
>  static void func_sval(void);
>  static void func_rmid(void);
> -static void child_cnt(void);
> -static void child_pid(void);
>  static void func_iinfo(int);
>  static void func_sinfo(void);
>  static void func_sstat(int);
>  

We could drop all these declarations by moving tcases struct
just before verify_semctl().


> +static key_t key;
> +static int sem_id = -1;
> +static int sem_index;
>  static struct semid_ds buf;
>  static struct seminfo ipc_buf;
>  static unsigned short array[PSEMS];
>  static struct sembuf sops;
> -
> -#define INCVAL 2
> -#define NEWMODE	066
> -#define NCHILD	5
> -#define SEM2	2
> -#define SEM4	4
> -#define ONE	1
> -#ifdef _XLC_COMPILER
> -#define SEMUN_CAST
> -#else
> -#define SEMUN_CAST (union semun)
> -#endif
> -
>  static int pid_arr[NCHILD];
>  
> -#ifdef UCLINUX
> -#define PIPE_NAME	"semctl01"
> -static char *argv0;
> -static int sem_op;
> -#endif
> -
> -static struct test_case_t {
> +static struct tcases {
>  	int *semid;
>  	int semnum;
>  	int cmd;
>  	void (*func_test) ();
>  	union semun arg;
>  	void (*func_setup) ();
> -} TC[] = {
> -	{&sem_id_1, 0, IPC_STAT, func_stat, SEMUN_CAST & buf, NULL},
> -	{&sem_id_1, 0, IPC_SET, func_set, SEMUN_CAST & buf, set_setup},
> -	{&sem_id_1, 0, GETALL, func_gall, SEMUN_CAST array, NULL},
> -	{&sem_id_1, SEM4, GETNCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
> -	{&sem_id_1, SEM2, GETPID, func_pid, SEMUN_CAST & buf, pid_setup},
> -	{&sem_id_1, SEM2, GETVAL, func_gval, SEMUN_CAST & buf, NULL},
> -	{&sem_id_1, SEM4, GETZCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
> -	{&sem_id_1, 0, SETALL, func_sall, SEMUN_CAST array, sall_setup},
> -	{&sem_id_1, SEM4, SETVAL, func_sval, SEMUN_CAST INCVAL, NULL},
> -	{&sem_id_1, 0, IPC_INFO, func_iinfo, SEMUN_CAST & ipc_buf, NULL},
> -	{&sem_id_1, 0, SEM_INFO, func_sinfo, SEMUN_CAST & ipc_buf, NULL},
> +} tests[] = {
> +	{&sem_id, 0, IPC_STAT, func_stat, SEMUN_CAST & buf, NULL},
> +	{&sem_id, 0, IPC_SET, func_set, SEMUN_CAST & buf, set_setup},
> +	{&sem_id, 0, GETALL, func_gall, SEMUN_CAST array, NULL},
> +	{&sem_id, 4, GETNCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
> +	{&sem_id, 2, GETPID, func_pid, SEMUN_CAST & buf, pid_setup},
> +	{&sem_id, 2, GETVAL, func_gval, SEMUN_CAST & buf, NULL},
> +	{&sem_id, 4, GETZCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
> +	{&sem_id, 0, SETALL, func_sall, SEMUN_CAST array, sall_setup},
> +	{&sem_id, 4, SETVAL, func_sval, SEMUN_CAST INCVAL, NULL},
> +	{&sem_id, 0, IPC_INFO, func_iinfo, SEMUN_CAST & ipc_buf, NULL},
> +	{&sem_id, 0, SEM_INFO, func_sinfo, SEMUN_CAST & ipc_buf, NULL},
>  	{&sem_index, 0, SEM_STAT, func_sstat, SEMUN_CAST & buf, NULL},
> -	{&sem_id_1, 0, IPC_RMID, func_rmid, SEMUN_CAST & buf, NULL},
> +	{&sem_id, 0, IPC_RMID, func_rmid, SEMUN_CAST & buf, NULL},
>  };
>  
> -int TST_TOTAL = ARRAY_SIZE(TC);
> -
>  static void kill_all_children(void)
>  {
> -	int j, status;
> -
> -	for (j = 0; j < NCHILD; j++) {
> -		SAFE_KILL(cleanup, pid_arr[j], SIGKILL);
> -	}
> -
> -	/*
> -	 * make sure children finished before we proceed with next testcase
> -	 */
> -	for (j = 0; j < NCHILD; j++) {
> -		SAFE_WAIT(cleanup, &status);
> -	}
> -}
> -
> -int main(int argc, char *argv[])
> -{
> -	int lc;
> -	int i;
> +	int j;
>  
> -	tst_parse_opts(argc, argv, NULL, NULL);
> -
> -#ifdef UCLINUX
> -	argv0 = argv[0];
> -	maybe_run_child(&child_pid, "nd", 1, &sem_id_1);
> -	maybe_run_child(&child_cnt, "ndd", 2, &sem_id_1, &sem_op);
> -#endif
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		for (i = 0; i < TST_TOTAL; i++) {
> -
> -			/*
> -			 * Set up any conditions if needed
> -			 */
> -			if (TC[i].func_setup != NULL) {
> -				/* call the setup function */
> -				switch (TC[i].cmd) {
> -				case GETNCNT:
> -					(*TC[i].func_setup) (-ONE);
> -					break;
> -				case GETZCNT:
> -					(*TC[i].func_setup) (0);
> -					break;
> -				default:
> -					(*TC[i].func_setup) ();
> -					break;
> -				}
> -			}
> -
> -			TEST(semctl(*(TC[i].semid), TC[i].semnum, TC[i].cmd,
> -				    TC[i].arg));
> -
> -			if (TEST_RETURN == -1) {
> -				tst_resm(TFAIL, "%s call failed - errno = %d "
> -					 ": %s", TCID, TEST_ERRNO,
> -					 strerror(TEST_ERRNO));
> -			} else {
> -				/*
> -				 * call the appropriate test function
> -				 * and pass the return value where it
> -				 * is needed to perform certain tests.
> -				 */
> -				switch (TC[i].cmd) {
> -				case GETNCNT:
> -				case GETZCNT:
> -				case GETPID:
> -				case GETVAL:
> -				case IPC_INFO:
> -				case SEM_STAT:
> -					(*TC[i].func_test) (TEST_RETURN);
> -					break;
> -				default:
> -					(*TC[i].func_test) ();
> -					break;
> -				}
> -			}
> -
> -			/*
> -			 * If testing GETNCNT or GETZCNT, clean up the children.
> -			 */
> -			switch (TC[i].cmd) {
> -			case GETNCNT:
> -			case GETZCNT:
> -				kill_all_children();
> -				break;
> -			}
> -		}
> -		/*
> -		 * recreate the semaphore resource if looping
> -		 */
> -		if (TEST_LOOPING(lc)) {
> -			sem_id_1 = semget(semkey, PSEMS,
> -					  IPC_CREAT | IPC_EXCL | SEM_RA);
> -			if (sem_id_1 == -1)
> -				tst_brkm(TBROK, cleanup,
> -					 "couldn't recreate " "semaphore");
> -		}
> -	}
> +	for (j = 0; j < NCHILD; j++)
> +		SAFE_KILL(pid_arr[j], SIGKILL);
>  
> -	cleanup();
> -
> -	tst_exit();
> +	for (j = 0; j < NCHILD; j++)
> +		SAFE_WAIT(NULL);
>  }
>  
> -/*
> - * func_stat() - check the functionality of the IPC_STAT command with semctl()
> - */
>  static void func_stat(void)
>  {
> -	/* check the number of semaphores and the ipc_perm.mode value */
>  	if (buf.sem_nsems == PSEMS && buf.sem_perm.mode == (SEM_RA))
> -		tst_resm(TPASS, "buf.sem_nsems and buf.sem_perm.mode"
> -			 " are correct");
> +		tst_res(TPASS, "buf.sem_nsems and buf.sem_perm.mode are correct");
>  	else
> -		tst_resm(TFAIL, "semaphore STAT info is incorrect");
> +		tst_res(TFAIL, "semaphore STAT info is incorrect");
>  }
>  
> -/*
> - * set_setup() - set up for the IPC_SET command with semctl()
> - */
>  static void set_setup(void)
>  {
> -	/* set up a new mode for the semaphore set */
>  	buf.sem_perm.mode = SEM_RA | NEWMODE;
>  }
>  
> -/*
> - * func_set() - check the functionality of the IPC_SET command with semctl()
> - */
>  static void func_set(void)
>  {
> -	/* first stat the semaphore to get the new data */
> -	if (semctl(sem_id_1, 0, IPC_STAT, (union semun)&buf) == -1) {
> -		tst_resm(TBROK, "stat failed in func_set()");
> -		return;
> -	}
> +	SAFE_SEMCTL(sem_id, 0, IPC_STAT, (union semun)&buf);
>  
> -	/* check that the new mode is what we set */
>  	if (buf.sem_perm.mode == (SEM_RA | NEWMODE))
> -		tst_resm(TPASS, "buf.sem_perm.mode is correct");
> +		tst_res(TPASS, "buf.sem_perm.mode is correct");
>  	else
> -		tst_resm(TFAIL, "semaphore mode info is incorrect");
> +		tst_res(TFAIL, "semaphore mode info is incorrect");
>  }
>  
> -/*
> - * func_gall() - check the functionality of the GETALL command with semctl()
> - */
>  static void func_gall(void)
>  {
>  	int i;
>  
> -	/* the initial value of the primitive semaphores should be zero */
>  	for (i = 0; i < PSEMS; i++) {
>  		if (array[i] != 0) {
> -			tst_resm(TFAIL, "semaphore %d has unexpected value", i);
> +			tst_res(TFAIL, "semaphore %d has unexpected value", i);
>  			return;
>  		}
>  	}
> -	tst_resm(TPASS, "semaphores have expected values");
> +	tst_res(TPASS, "semaphores have expected values");
> +}
> +
> +static void child_cnt(void)
> +{
> +	sops.sem_num = 4;
> +	sops.sem_flg = 0;
> +
> +	/*
> +	 * Do a semop that will cause the child to sleep.
> +	 * The child process will be killed in the func_ncnt
> +	 * routine which should cause an error to be return
> +	 * by the semop() call.
> +	 */
> +	if (semop(sem_id, &sops, 1) != -1)
> +		tst_brk(TBROK, "semop succeeded - cnt_setup");
>  }
>  
> -/*
> - * cnt_setup() - set up for the GETNCNT and GETZCNT commands with semctl()
> - */
>  static void cnt_setup(int opval)
>  {
>  	int pid, i;
>  
> -	sops.sem_num = SEM4;
> +	sops.sem_num = 4;
>  	sops.sem_flg = 0;
> -
>  	/*
>  	 * if seting up for GETZCNT, the semaphore value needs to be positive
>  	 */
>  	if (opval == 0) {
> -		/* initialize the semaphore value to ONE */
> -		sops.sem_op = ONE;
> -		if (semop(sem_id_1, &sops, 1) == -1)
> -			tst_brkm(TBROK, cleanup, "semop #1 failed - cnt_setup");
> +		sops.sem_op = 1;
> +		SAFE_SEMOP(sem_id, &sops, 1);
>  	}
>  
> -	/* set the correct operation */
>  	sops.sem_op = opval;
>  	for (i = 0; i < NCHILD; i++) {
> -		/* fork five children to wait */
> -		pid = FORK_OR_VFORK();
> -		if (pid == -1)
> -			tst_brkm(TBROK, cleanup, "fork failed in cnt_setup");
> -
> +		pid = SAFE_FORK();
>  		if (pid == 0) {
> -#ifdef UCLINUX
> -			sem_op = sops.sem_op;
> -			if (self_exec(argv0, "ndd", 2, sem_id_1, sem_op) < 0)
> -				tst_brkm(TBROK, cleanup, "self_exec failed "
> -					 "in cnt_setup");
> -#else
>  			child_cnt();
> -#endif
>  		} else {
> -			TST_PROCESS_STATE_WAIT(cleanup, pid, 'S');
> -			/* save the pid so we can kill it later */
> +			TST_PROCESS_STATE_WAIT(pid, 'S', 0);
>  			pid_arr[i] = pid;
>  		}
>  	}
>  }
>  
> -static void child_cnt(void)
> +static void func_cnt(int rval)
>  {
> -#ifdef UCLINUX
> -	sops.sem_op = (short int)sem_op;
> -#endif
> +	if (rval == NCHILD)
> +		tst_res(TPASS, "number of sleeping processes is correct");
> +	else
> +		tst_res(TFAIL, "number of sleeping processes is not correct");
> +}
>  
> -	sops.sem_num = SEM4;
> +static void child_pid(void)
> +{
> +	sops.sem_num = 2;
> +	sops.sem_op = 1;
>  	sops.sem_flg = 0;
> -
>  	/*
> -	 * Do a semop that will cause the child to sleep.
> -	 * The child process will be killed in the func_ncnt
> -	 * routine which should cause an error to be return
> -	 * by the semop() call.
> +	 * Do a semop that will increment the semaphore.
>  	 */
> -	if (semop(sem_id_1, &sops, 1) != -1)
> -		tst_resm(TBROK, "semop succeeded - cnt_setup");
> -
> +	SAFE_SEMOP(sem_id, &sops, 1);
>  	exit(0);
>  }
>  
> -/*
> - * func_cnt() - check the functionality of the GETNCNT and GETZCNT commands
> - *	        with semctl()
> - */
> -static void func_cnt(int rval)
> -{
> -
> -	if (rval == NCHILD)
> -		tst_resm(TPASS, "number of sleeping processes is correct");
> -	else
> -		tst_resm(TFAIL, "number of sleeping processes is not correct");
> -}
> -
> -/*
> - * pid_setup() - set up for the GETPID command with semctl()
> - */
>  static void pid_setup(void)
>  {
>  	int pid;
>  
> -	/*
> -	 * Fork a child to do a semop that will pass.
> -	 */
> -	pid = FORK_OR_VFORK();
> -	if (pid == -1)
> -		tst_brkm(TBROK, cleanup, "fork failed in pid_setup()");
> -
> -	if (pid == 0) {		/* child */
> -#ifdef UCLINUX
> -		if (self_exec(argv0, "nd", 1, sem_id_1) < 0)
> -			tst_brkm(TBROK, cleanup, "self_exec failed "
> -				 "in pid_setup()");
> -#else
> +	pid = SAFE_FORK();
> +	if (pid == 0) {
>  		child_pid();
> -#endif
>  	} else {
> -		pid_arr[SEM2] = pid;
> -		TST_PROCESS_STATE_WAIT(cleanup, pid, 'Z');
> +		pid_arr[2] = pid;
> +		TST_PROCESS_STATE_WAIT(pid, 'Z', 0);
>  	}
>  }
>  
> -static void child_pid(void)
> -{
> -	sops.sem_num = SEM2;
> -	sops.sem_op = ONE;
> -	sops.sem_flg = 0;
> -	/*
> -	 * Do a semop that will increment the semaphore.
> -	 */
> -	if (semop(sem_id_1, &sops, 1) == -1)
> -		tst_resm(TBROK, "semop failed - pid_setup");
> -	exit(0);
> -}
> -
> -/*
> - * func_pid() - check the functionality of the GETPID command with semctl()
> - */
>  static void func_pid(int rval)
>  {
> -	/* compare the rval (pid) to the saved pid from the setup */
> -	if (rval == pid_arr[SEM2])
> -		tst_resm(TPASS, "last pid value is correct");
> +	if (rval == pid_arr[2])
> +		tst_res(TPASS, "last pid value is correct");
>  	else
> -		tst_resm(TFAIL, "last pid value is not correct");
> +		tst_res(TFAIL, "last pid value is not correct");
>  }
>  
> -/*
> - * func_gval() - check the functionality of the GETVAL command with semctl()
> - */
>  static void func_gval(int rval)
>  {
>  	/*
> @@ -431,142 +201,138 @@ static void func_gval(int rval)
>  	 * to ONE as it was set in the last test (GETPID).
>  	 */
>  	if (rval == 1)
> -		tst_resm(TPASS, "semaphore value is correct");
> +		tst_res(TPASS, "semaphore value is correct");
>  	else
> -		tst_resm(TFAIL, "semaphore value is not correct");
> +		tst_res(TFAIL, "semaphore value is not correct");
>  }
>  
> -/*
> - * all_setup() - set up for the SETALL command with semctl()
> - */
>  static void sall_setup(void)
>  {
>  	int i;
>  
>  	for (i = 0; i < PSEMS; i++) {
> -		/* initialize the array values to 3 */
>  		array[i] = 3;
>  	}
>  }
>  
> -/*
> - * func_sall() - check the functionality of the SETALL command with semctl()
> - */
>  static void func_sall(void)
>  {
>  	int i;
>  	unsigned short rarray[PSEMS];
>  
> -	/*
> -	 * do a GETALL and compare the values to those set above
> -	 */
> -
> -	if (semctl(sem_id_1, 0, GETALL, (union semun)rarray) == -1)
> -		tst_brkm(TBROK, cleanup, "semctl failed in func_sall");
> -
> +	SAFE_SEMCTL(sem_id, 0, GETALL, (union semun)rarray);
>  	for (i = 0; i < PSEMS; i++) {
>  		if (array[i] != rarray[i]) {
> -			tst_resm(TFAIL, "semaphore values are not correct");
> +			tst_res(TFAIL, "semaphore values are not correct");
>  			return;
>  		}
>  	}
>  
> -	tst_resm(TPASS, "semaphore values are correct");
> +	tst_res(TPASS, "semaphore values are correct");
>  }
>  
> -/*
> - * func_sval() - check the functionality of the SETVAL command with semctl()
> - */
>  static void func_sval(void)
>  {
>  	int semv;
>  	union semun arr;
>  
> -	/*
> -	 * do a GETVAL and compare it to the value set above
> -	 */
> -
> -	semv = semctl(sem_id_1, SEM4, GETVAL, arr);
> -	if (semv == -1)
> -		tst_brkm(TBROK, cleanup, "semctl failed in func_sval");
> -
> +	semv = SAFE_SEMCTL(sem_id, 4, GETVAL, arr);
>  	if (semv != INCVAL)
> -		tst_resm(TFAIL, "semaphore value is not what was set");
> +		tst_res(TFAIL, "semaphore value is not what was set");
>  	else
> -		tst_resm(TPASS, "semaphore value is correct");
> +		tst_res(TPASS, "semaphore value is correct");
>  }
>  
> -/*
> - * func_rmid() - check the functionality of the IPC_RMID command with semctl()
> - */
>  static void func_rmid(void)
>  {
> -
> -	/*
> -	 * do a semop() - we should get EINVAL
> -	 */
> -	if (semop(sem_id_1, &sops, 1) != -1)
> -		tst_resm(TFAIL, "semop succeeded on expected fail");
> -
> -	if (errno != EINVAL)
> -		tst_resm(TFAIL, "returned errno - %d - is not expected", errno);
> -	else
> -		tst_resm(TPASS, "semaphore appears to be removed");
> -
> -	sem_id_1 = -1;
> +	TST_EXP_FAIL(semop(sem_id, &sops, 1), EINVAL, "semaphore appears to be removed");
> +	sem_id = -1;
>  }
>  
>  static void func_iinfo(int hidx)
>  {
>  	if (hidx >= 0) {
>  		sem_index = hidx;
> -		tst_resm(TPASS, "the highest index is correct");
> +		tst_res(TPASS, "the highest index is correct");
>  	} else {
>  		sem_index = 0;
> -		tst_resm(TFAIL, "the highest index is incorrect");
> +		tst_res(TFAIL, "the highest index is incorrect");
>  	}
>  }
>  
>  static void func_sinfo(void)
>  {
>  	if (ipc_buf.semusz < 1)
> -		tst_resm(TFAIL, "number of semaphore sets is incorrect");
> +		tst_res(TFAIL, "number of semaphore sets is incorrect");
>  	else
> -		tst_resm(TPASS, "number of semaphore sets is correct");
> +		tst_res(TPASS, "number of semaphore sets is correct");
>  }
>  
>  static void func_sstat(int semidx)
>  {
>  	if (semidx >= 0)
> -		tst_resm(TPASS, "id of the semaphore set is correct");
> +		tst_res(TPASS, "id of the semaphore set is correct");
>  	else
> -		tst_resm(TFAIL, "id of the semaphore set is incorrect");
> +		tst_res(TFAIL, "id of the semaphore set is incorrect");
>  }
>  
> -void setup(void)
> +static void verify_semctl(unsigned int n)
>  {
> +	struct tcases *tc = &tests[n];
> +	int rval;
>  
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	TST_CHECKPOINT_INIT(tst_rmdir);
> +	if (sem_id == -1)
> +		sem_id = SAFE_SEMGET(key, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
> +	if (tc->func_setup != NULL) {
> +		switch (tc->cmd) {
> +		case GETNCNT:
> +			tc->func_setup(-1);
> +			break;
> +		case GETZCNT:
> +			tc->func_setup(0);
> +			break;
> +		default:
> +			tc->func_setup();
> +			break;
> +		}
> +	}
>  
> -	/* get an IPC resource key */
> -	semkey = getipckey();
> +	rval = SAFE_SEMCTL(*(tc->semid), tc->semnum, tc->cmd, tc->arg);
> +	switch (tc->cmd) {
> +	case GETNCNT:
> +	case GETZCNT:
> +	case GETPID:
> +	case GETVAL:
> +	case IPC_INFO:
> +	case SEM_STAT:
> +		(*tc->func_test)(rval);
> +		break;
> +	default:
> +		(*tc->func_test)();
> +		break;
> +	}
>  
> -	/* create a semaphore set with read and alter permissions */
> -	sem_id_1 = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
> -	if (sem_id_1 == -1)
> -		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
> +	if (tc->cmd == GETNCNT || tc->cmd == GETZCNT)
> +		kill_all_children();
>  }
>  
> -void cleanup(void)
> +static void setup(void)
>  {
> -	/* if it exists, remove the semaphore resource */
> -	rm_sema(sem_id_1);
> +	key = GETIPCKEY();
> +	sem_id = SAFE_SEMGET(key, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
> +}
>  
> -	tst_rmdir();
> +static void cleanup(void)
> +{
> +	if (sem_id >= 0)
> +		SAFE_SEMCTL(sem_id, 0, IPC_RMID);
>  }
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test = verify_semctl,
> +	.tcnt = ARRAY_SIZE(tests),
> +	.needs_root = 1,

Does it really require root?

> +	.forks_child = 1,
> +};
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
