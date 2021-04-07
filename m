Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D535732D
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 19:27:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2151D3C7397
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 19:27:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 491893C1DD9
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 19:27:37 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0D7D3600714
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 19:27:36 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 137HO8Dd028792;
 Wed, 7 Apr 2021 17:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=NL+mZ7arMLCDkD4wNUvMyKES3ytEhvpxgXeq0YeLJXc=;
 b=r+lYz2W+sZBLuI5URTzgjEa1v/dF8w9nyxfJyA2W9lN0ZdyL3LmWJuyl83/otiQBxCqz
 Wkxpo4PPaDgXVNj5Yz4ovdVXlEaa2vbQgNreb74x5pkbZ27wwU0TzbXknjMwzeCigUyK
 cVt46tIo1kKWAcdDzPacFfV1eNAZjKnl76GqmuFjjpbjrbp9ZTms5AlXIKhHB8WNBtPV
 LpoeuMJlpSINP+W27cn/ygVE5v6yFDhNvrsheQHdMpDa9WZc6ufpNlSZeG217FmnaL7o
 /zKU7wMIo8MoMpgONg6JnY/uu0tXTo6MId6sqdYJRT3A/u0RG5u9XxfJQtMmOpeRilM1 6w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 37rvagbc1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Apr 2021 17:27:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 137HQ5EE016329;
 Wed, 7 Apr 2021 17:27:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by aserp3030.oracle.com with ESMTP id 37rvbfac7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Apr 2021 17:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ktg5LpcrAZGgRv9XWgpjxvpOIqSBfBi+xFO5bhXlK1lS7e7DdcBRntRwc8nFhCr34uwVocdA9t3sg0VnARln9g9v1nMLxnxTGCr6kuOXSBA/E0SfYQgEPnAzGRpJERmokih99t6YxWG4qLurxsaQYVOgZN7DQG+cE+funFFoJeWwdD1QlIpoAtPrj0GT5DekrbWC73PPRyFmwZO6HzBx4gqFzY9KznGuSn458PsDosf1z6r37vcCPYrVP+yEmZOJKzrs0DGObd0hAOnCYV5Xkspo+9S8EKo1hhueIXaQzRb7+P6mE0ug8ZAAc4oxLPRYn3FakpLXcPyffbR7hShA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL+mZ7arMLCDkD4wNUvMyKES3ytEhvpxgXeq0YeLJXc=;
 b=Mzj2KRBHCBfeqc3kRT7hxK5Ri6tE8tFKPzxSGD5upDWSv+2L+Cpa0d9o8ExGxnLtH/O1/8CCMzXlhRI9sqlzisX8kuJXusXdd/FfcPCP3buDjIdsyVvnyaPpy0dI1K3k+LYyea/LTaWyeEvwIFPb0sJgiVzjBoKe7hgfVqlCnRmHkZsP+pqbJa1ZGuF7M+KDC6SDCzfR6RF404pIws6yVEtAuH3Dud7XDAK//ncqae4CpGS5i7YfXWCyY8WuhxfOH1mMRz0bA0ZcQ4LKXGRaV5imDs5YwAP9MY5siHhs+4BohrB79JtIVO+MmCj9rbYeFvH34RSj9xcB4aHwzMEUHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL+mZ7arMLCDkD4wNUvMyKES3ytEhvpxgXeq0YeLJXc=;
 b=g2ohWYT5GQGwHPvE9id/nIhpdRa4Mk3YQKBUa5+Uhg4sdi7QUX7fQIcRLN4XiAzGVYHa1H0v3fJWxIDXVPY6vh8fsg4zu1TTVFVk7yslU40V5CDv6JPsazYr9ULCjsvHVEl6AeD7EZGroSd9m/Icw/2rDvTXQDDQjPD1Bt0woF0=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by BY5PR10MB3972.namprd10.prod.outlook.com (2603:10b6:a03:1b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 17:27:24 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 17:27:24 +0000
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <cf081e19-300c-1dc7-69ee-894881613858@oracle.com>
Date: Wed, 7 Apr 2021 20:27:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47)
 To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.52] (95.161.221.177) by
 AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 17:27:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cb91f52-975e-4fce-1dc6-08d8f9ea6823
X-MS-TrafficTypeDiagnostic: BY5PR10MB3972:
X-Microsoft-Antispam-PRVS: <BY5PR10MB3972643F89CD42A3A6087506FD759@BY5PR10MB3972.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHIJSFo9lnlpYWxiW0udzr2/WbTNhNww+n7HCnsJCTvgWiMpcNwOFzpIiC1+teGD8GgtwY8jNiInxz8WzeHlRm4WS9WJyjNqXF32LReNPgBSzpbVXYq/NbMsCKNbPY+OT+TD+v/MWVvb2rO48/NyuIrWJ5mURtObLsadgYV3L8XljVMOdR3EfyYeI/OQBqJpalo0iLpBLxpFMsrWDSJfNhYGT0GDm7jV/dTWmUai6V0jZxO1QQbhyWCRqnWhpwd0kzn3LH7anHCoDq6lu2SkJymb+DNMLYUri2CwknJcEZ8bD0WRYQa8v7aI8VMyeZh0oc5Zo4oaD03RsoTLtrQgVlFmtDUcuVzH70QsohioOdGtw2qGGGPlnTGlSy0vhHEPe+lBucqpLOgDQGqFGRVC+84ibk6rlJ47s52Zc6ruCTAppETl+ZovOniSI8niuoKdUEJZiDdf7/QAb4Ky+kO025ro/pJv/lDvOCMD9sCL1mkOH2+YmQiQaq9emIunFiytAab+TI4gJxNqRdufZVYC+WX6vLmvU5XgCt5rU/DHEcD55z0G91umSO3khlmSC/v/83cn0K6qfvmhN4hWHc7c2zlb4bvX+Ym5J/DdBvJUkLWLji9dyIsb/MUfL5cx1FwDsjp3B/P11dwop7CBfAbI4sk9LW9uPxsmOMSOlGs+mHto9HzvNwTF4d7c9x6/sh3m96JPTszWoykUG4bTwlm0pHZx3FuQosYDW2+KWfvYJq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(366004)(396003)(136003)(38100700001)(5660300002)(31686004)(36756003)(16526019)(6486002)(8936002)(66556008)(956004)(6666004)(2616005)(316002)(66946007)(66476007)(53546011)(44832011)(2906002)(16576012)(478600001)(26005)(86362001)(186003)(8676002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N3VvM1RQakhrU3JMSFVLaHBKdENtamFNN01OT3VBNCtWRkpCOTZxT2NEV2gx?=
 =?utf-8?B?MTJzT3NuOWVETkFJNUp3NVpWTllka2ZrcWZoc2xzeTRXZEcvblFIQlh3WFZq?=
 =?utf-8?B?VEEycnZUblEwN0x5Y2xoV09ZaFR0bzRuU3BYc0Jqa2wvYXBsRW9jaXlOT3NU?=
 =?utf-8?B?RjgrbUt6ajhLNzB6N2JGNGhIYzdocG1aQ0NzZnk3YUdlVzl6OWQydk9XbWM2?=
 =?utf-8?B?NkNNZ2JBSFlrSldxeU9MOXFsNDBGS3RCK1ExMEN3anh0OU01dmpESWtpbElL?=
 =?utf-8?B?OFdNVVNPUGRkdHQzRW8rL3Y5SXBTSVVVejhEQU01eW10bllnYjdkR0RiRmdx?=
 =?utf-8?B?c1lxaWc1b2o1U204Uk5Oc2xhTFRSRzlPOHVpR1RITGthYndXaEFSdFllUkVX?=
 =?utf-8?B?bVRYWDlMYk1udm9LS0NzRzcvVldyR25kdUVRUXMyTkVlMkErbWNiUkJGVDMy?=
 =?utf-8?B?VXRUNnozUnNiVjI4SDZ3UUtCcVVpN0FzdGJvUWpLa2lCZDNJYlNLaGwvd0ox?=
 =?utf-8?B?OGVHUHhWS0NrQVRwZDA4d1VwZU5BOU94MytoMjAzQU51VFM0Um5zZVVwNFFv?=
 =?utf-8?B?aHhad1F2RHU1YTFwNUY3Zm5kQU51c3hHbmtrT0p3MXJGeFd3L3VmdFVTVmsr?=
 =?utf-8?B?K0Y2M3pWV21WY2EzcWJ4YmtobDJ3MjZlTFlNY1BteFFkNDFPcFBzUFBNcjFh?=
 =?utf-8?B?eEQ5SStkd0hnNmpTWmd3ajI5N2hLVkcrSXVOQVZaMm1NdmJIcTR3emtZcXVV?=
 =?utf-8?B?MEt5dG5UWWRmaXF4T0oxc0Z3Y3AwallObGF6am5FaVVPa2htNDhiZFUvMUpX?=
 =?utf-8?B?MUNnQ0J5L1FEeHZtallmYzBCc3VheGNBdE8yY21YNkZRdmNVTGp0emN2dGNz?=
 =?utf-8?B?RnlzeDRXZ3Jta1cxanJ5cGpJQjZXUHZHU21rbVZaQ01lZitsN0ZYSkYvdmo5?=
 =?utf-8?B?WlhESk9wNjNLZ1RFYjdQU1Y3ZllQUTlHQkZkZVl1WVJSOUVQa0VJVG1CVVpM?=
 =?utf-8?B?dXpTOFBwdkNmL3BmMnNscmZHcXd2cXZxUHRmUUZrMzk5M2htTXdFSXMrbGFu?=
 =?utf-8?B?Z0tuVlREQW1nZDVlZDFwM09kNmFXaDljaUYydkp2VndhU0U2WXZlQjIzNTN3?=
 =?utf-8?B?aFk0dGJHTEVLRGZEQU9sVTNzN1laS3UyYWphK1Vad3FkVXBHRmUzWHE0QmlG?=
 =?utf-8?B?dHcyK0YzZVAvZEZLd25iYmkwTWp4N0JZRUk0UStDcXNraTNxWTRITzZFc0th?=
 =?utf-8?B?ZTN5c3VYSDNYNDBKL0IybWhubDZHdzdYQUpPVm5NOFE5MUVSdStrQ25PSk9w?=
 =?utf-8?B?czZRUkZEd1A1VGRFVVBYUWQ2dE94V2JIckxxcXdXWGczSkYvd1RtdE55bGlV?=
 =?utf-8?B?OVM1R25tNmZKM2VDcW1IdWlaRzV6NnhNVzFzMUU0NzNIMVNHejg5V0tIZ1lD?=
 =?utf-8?B?d2p1dUdJQ2hlUGlOZkRld2NSaXpFOEcvVEVFQmdjSW16MGhHTnpRWmFWQy9h?=
 =?utf-8?B?NitkR0FoNkZYQ1NnTlZHNjMwTVRWQTg3WHFCam9HTE1ud2VZZ1BOb2VIVGpm?=
 =?utf-8?B?SlFENlU2UmZtMzBHeE9JQllWWkh1eTUwdEN4QVR2NGRsNHFFbnB4cWRPR0No?=
 =?utf-8?B?ZzVjdXBjM1U3MlZ3V1QybWhaZjhqRUNyTDV6U0FkelFvd04wVmVZb1ZmRkg4?=
 =?utf-8?B?WHlvVWRTdnkwU0F0SU90RmQ2REZ4M1NQL1lQVXU1N1lFYkdiZjdrL0x3VUxa?=
 =?utf-8?Q?pIRVMf2YANpxnfve7kVwSNkMOGdPCgalO/+i39S?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb91f52-975e-4fce-1dc6-08d8f9ea6823
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 17:27:23.9559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsGxmNaqwvZKuT0HWRDiu3slY11XfgbveINiTyGRFpt4TvXx0Pt566cRVlvl3+2INU0RhngPfV4T/y6t4b1tNIG5CoUtOl4zNFLsLb4KKWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3972
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070119
X-Proofpoint-GUID: nr3v274CWSbW-7qDwp0bhR1XxEPpgPMH
X-Proofpoint-ORIG-GUID: nr3v274CWSbW-7qDwp0bhR1XxEPpgPMH
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070119
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
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
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  include/tst_safe_sysv_ipc.h |  4 ++++
>  lib/tst_safe_sysv_ipc.c     | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/tst_safe_sysv_ipc.h b/include/tst_safe_sysv_ipc.h
> index bb6532662..7804ce192 100644
> --- a/include/tst_safe_sysv_ipc.h
> +++ b/include/tst_safe_sysv_ipc.h
> @@ -65,4 +65,8 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
>  	(semid) = ((cmd) == IPC_RMID ? -1 : (semid)); \
>  	tst_ret_; })
>  
> +int safe_semop(const char *file, const int lineno, int semid, struct sembuf *sops,
> +		size_t nsops);
> +#define SAFE_SEMOP(semid, sops, nsops) \
> +	safe_semop(__FILE__, __LINE__, (semid), (sops), (nsops))
>  #endif /* TST_SAFE_SYSV_IPC_H__ */
> diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
> index e72985d61..012f5ba38 100644
> --- a/lib/tst_safe_sysv_ipc.c
> +++ b/lib/tst_safe_sysv_ipc.c
> @@ -227,3 +227,21 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
>  
>  	return rval;
>  }
> +
> +int safe_semop(const char *file, const int lineno, int semid, struct sembuf *sops,
> +		size_t nsops)
> +{
> +	int rval;
> +
> +	rval = semop(semid, sops, nsops);
> +	if (rval == -1) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"semop(%d, %p, %zu) failed", semid, sops, nsops);
> +	} else if (rval < 0) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"Invalid semop(%d, %p, %zu) return value %d",
> +			semid, sops, nsops, rval);
> +	}
> +
> +	return rval;
> +}
> 

Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
