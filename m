Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D81035A11F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 16:34:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C49B3C7F44
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 16:34:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F1B43C1D8A
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 16:34:32 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6358C1A01141
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 16:34:31 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139EPT1q189605;
 Fri, 9 Apr 2021 14:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=MbJtfTkf6LPq3knJEMNh+ql0eNjVYTrhvRMqbT6YaVU=;
 b=EgAZPiaVbv050YUnWjP4ZhgFkJY10gIzJouJ42YI6lez8a0LnK+0zr0fMQkCiEghButQ
 G2f8jARLj/KwGlQkXd9FoTtwJTvuP0ZgtbgjNnUE13aSafH+tp+o+mENSGEMzPo4c901
 PBYj9oALA7eYGJaJAZST7l47v5Orc/vfBGiRcbBWSFk8/3FoNtAbAuDbcnwo4oGPJxYC
 q1lWXehIkGHA9aEzf+Cd+8BcJ6l1DC0c8HFnmCbV5Tm4TWHfpPpS4V8xmsGHJ5tX6t0r
 aZiGWV0KMcHZhnFccRfXPxiGPzCRqJX6s/HGAeJPd9XHuTjfuAqHRPDcdjChnvII0rLY og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37rvaw9kqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 14:34:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139EQEmR012131;
 Fri, 9 Apr 2021 14:34:24 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by aserp3030.oracle.com with ESMTP id 37rvbhp7qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 14:34:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ll7dPmsZVT1qkWLcbOPywmG84zwaxrpTuJ0TZuf/37CIZq/Tkq2Q4nKtBlfZM+k7g91/ve/u0l/tSizQrLSqBz8Bz6HAOUsBWiviiKq/Sn8AjsVVQgld3reV3lPU2S6ScYfvOqDCPo1kHdHQ3QUcXbhDSW56dbGn3rjcWquvn2wcjjl+/9XtkKY+MgIhng3NaExB8ynZuepgQ7TXWXzRvYPmj8BzMmTm2PvJwVOnHVu0Q1luLiWl+inuPMN5BfUI0QXoLBG/BxNE1vgXbOnKnYVj6ikRucM7dCjusD/oQUNYvYWy87+iCOeZvrwTV0usBkv76Qd2svWcAYK421C8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbJtfTkf6LPq3knJEMNh+ql0eNjVYTrhvRMqbT6YaVU=;
 b=DPgeCk4Js5k/weTg8N4G/zaTHYjU9kBOjf3KVZhVezIYO6uEHG46Z6w1OjB739X6bf89jvhUB1VqXqG4L4sEEmYJo9l52FUnRTkj3MvA0MG7dHcMiCKeLGEDbO36metRayeh+xY0+W2kJNOysKFISFIRyLIpT4nCPk7GPtLTehUYV+Rekj3NDhKqydHzpcX4MXtOBvXJ5K3C5W0QZPYHyjZuo7Zggj4oXTMQmCJCvQUJ9wVC3z+IgPeGquyZZuvKIMRunnDPgbUmW9nrbYrj0FtsWJu0OiRF03DKql5vKQ77hLGIPl6v2Ax3e32NSz3NO363beDTeguEd09BlT3GxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbJtfTkf6LPq3knJEMNh+ql0eNjVYTrhvRMqbT6YaVU=;
 b=yDUEMfGPam/FewmbOH+i3hlHqnw8o/LabCkQWrC1KbqEaMyI/WdtRTC2VyH0zxh7s3/uP2cgygeF63wLaFsT4yKgOzzsTmYtoZ/DAH1Md8LkgOwqDhf1vsTe5aORYuEFMqM4PkjAIaB9zY3D2f2MjGwmnvMGxJXcnFnzkZIHYtk=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3595.namprd10.prod.outlook.com (2603:10b6:5:17f::32)
 by DS7PR10MB5167.namprd10.prod.outlook.com (2603:10b6:5:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 9 Apr
 2021 14:34:22 +0000
Received: from DM6PR10MB3595.namprd10.prod.outlook.com
 ([fe80::c09e:18eb:db63:a366]) by DM6PR10MB3595.namprd10.prod.outlook.com
 ([fe80::c09e:18eb:db63:a366%7]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 14:34:22 +0000
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>, ltp@lists.linux.it
References: <YHAoQooWArsl2rgD@yuki>
 <1617969305-2237-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1617969305-2237-3-git-send-email-xuyang2018.jy@fujitsu.com>
Message-ID: <d1c91207-35eb-402f-566c-1289ba2c786a@oracle.com>
Date: Fri, 9 Apr 2021 17:34:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <1617969305-2237-3-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: PR3P189CA0067.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::12) To DM6PR10MB3595.namprd10.prod.outlook.com
 (2603:10b6:5:17f::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.33] (95.161.221.177) by
 PR3P189CA0067.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 14:34:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec0aa298-6a7d-47c2-842a-08d8fb64912e
X-MS-TrafficTypeDiagnostic: DS7PR10MB5167:
X-Microsoft-Antispam-PRVS: <DS7PR10MB5167A452ED81E44AFFC429ECFD739@DS7PR10MB5167.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XtiB80kO82cBdXsndJWswgeWm5UOpeeH3Xqd5TztWtHyboAA1ptE/KWBoiHc/R+4sXwLaXMoPg3OMXOGgvgJ7yg5uZfcvfCrH05tobwdx3ZfgICqaRdY1bYlxJiFXNKmOkJR69/zbTgg/RKB4S/7W4KSnW65RZjvRqRmLvI/Jb0GwICTXgwaKDQnQ64XMeGbkLin1ci3hg2A4DuZhWAB5koww8BBO2kUymUeS+6Brt9JdqB2mP12QwdHtnzcyzIWv+MovZXkwVWV3sofiVfarmpXKMQ4OmhD3eVTlfP4PM+7Dhp+ZDSFvxxQJ6ofOrCAsAQqHjdhjr7PiUo0cp4YX629xtZ9VpdmHF9uxT40g49Y8p9LPvQVyjR+mPJQepgaKiZ/f2038EcO8rqymDr+8Zj4ip5bkRFadIc3aWI7d5W59jRqYBQ+zTIisarwlt0OG6j5XiJBLhDetEh09BqS/hfJFQTEXcTbHPFAGboqF243qAKYvbeJVOUvcl7luAMcDcSw5aWUiJB+qR6dznutQAWPXuFdXJEp4238Zq71uXyf3V+B0z9ZUiWxIqNEhgoHnjfAYTMu4Mipm9wtmbXlSQaew7XwvVTN4m+EA1KqX/wy0/emlC+8dRxsy4QuGG1nDPTI03rklG5x8cJ6nDgk7CxQYOoKbc69sSehnUEyo6heSi5KplL6RkD1gYq4PxFB+bA/wfwy5C0HM23ttTMOJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3595.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(396003)(346002)(136003)(86362001)(5660300002)(2616005)(8676002)(186003)(26005)(16526019)(38100700001)(16576012)(83380400001)(316002)(44832011)(66946007)(31696002)(478600001)(53546011)(36756003)(956004)(2906002)(6666004)(8936002)(66556008)(31686004)(66476007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RkQ5OXVmdDYySW52Y2RzTktVYmQyeGwzT2V2TjB0bjlQcU40MitBRE1sR01B?=
 =?utf-8?B?QTZTSE9hZzJNcDBEcXpSWm1uL0xFMUhjWVFGcWdYTlhTUFl5aFh2dFJ1MG1r?=
 =?utf-8?B?djVLc21IbTV3U0ZZVm01N3M3MTRSYXBkNS91UjMrakMzMUF0dHNzN1JiWnV4?=
 =?utf-8?B?M2ExdW9kemlOWU5PSjR4U2M0SXlWUnBvVlQ5a3BkMkxiT25KelUzUG45NWll?=
 =?utf-8?B?VmpOMk93QWs2NU51MzdpSXYzbldRc24zbUpDdCt6WHhUT0prdnpZbGlmZzNk?=
 =?utf-8?B?ZXA3NGRPcUJRQjVrVFZ3eUduY05ZYkhSY3cyRE5jbFdkMUFYRVh3LzZDYVk1?=
 =?utf-8?B?VVRtWm96eHhTLzFETXR2U29abkdyZ1doZlhGSXloQUpnWFV1Q2x6cEdiREJR?=
 =?utf-8?B?TWprcHQ4YUlCNHlsMTFQWXNOcXZTVGRLeEhsTmlQTDdSbFJJZEhROUhzM0NP?=
 =?utf-8?B?ekpVSUZpVUdZNUFROVBKNUlTMmtsNW9BN0ZvdWgvN1JMVUFoTkNVQjZjYWEw?=
 =?utf-8?B?OGlKRnJabk5yMGc0L2FaSDRzVFZhbDU1MlE0c2w4OGRSRm1KMHhaT3R4K2gr?=
 =?utf-8?B?Tk12RERmdUJjVkt1UWhGaXhlaU90Y2duemt1VGd1eHNCR0ZVQkRaUUwwMmJh?=
 =?utf-8?B?cHNxWEh4aWVDeFUvWE1yS1FNb212RW9lTm5CanU3RGlUWHZueitmRmtjSHNU?=
 =?utf-8?B?THFiQ0k3bFgvcjBiL1pnSkVoSnJGK1ZzNG5HN2pTYzd0MURpU3lZSFVuclJH?=
 =?utf-8?B?Z3d4THpzakNxdEFyM2ZVdXIzd2lLbjlyY3EwTWtBQndyU3JoY1YyNDJOYlBt?=
 =?utf-8?B?TUxHdzFiYXdCdEQwaGNKQjQ1eEw3RFQzQW01dTNFbVhmQ3JIQVlXVzg2WVZt?=
 =?utf-8?B?VmdCLzlTa2w0dVZqL2tNczRrSGpnd1dOcnVZNFY1Zk5pVHVjWmpkU2dhWDFW?=
 =?utf-8?B?OG52V0NibTd2TVJ5MGVmdkJWOEZySnlMSDE4MXY5MkpKc2RqNVNYdGJLMk9a?=
 =?utf-8?B?UlFWbWFSQWorcmNpQ1loc3dack1wOVRWR2lza1JXLzd0bXl2NWFrOTBsZU5h?=
 =?utf-8?B?Ykg1Y09NbC9zamwyd005NmRmdyt0YmNBK1UxNjJhaGhyV0toWDk3VnJZTkxC?=
 =?utf-8?B?b0ZDTTIrbzJMWkxNUmlURmtGMVc5dU5EdnZDbFA1dFBybDBiQ0tSMWphWHNH?=
 =?utf-8?B?VjFBcEFTTnErbVpwSnMyUldQbzNpcTB6b0c2QjkwMEVoM1lveURxVmdCNngz?=
 =?utf-8?B?LzgycXBwQzFtK1VGZGE2SUNlaFg0bFc1dEhFNHlqTGN0ZE4rb3hZeU1ta3lU?=
 =?utf-8?B?d05Lb0RhV3BxZm4xVnlQdzE5WWl2M3VxSkxaNlh4dys4TTFUTTVmK0RSSDNs?=
 =?utf-8?B?OHBWY3NucmIxQXp4QTAybHZiM2I2Z1RhbEFVS0dIUlpmaVZvMzc0SlpqVm9i?=
 =?utf-8?B?cEltcEVlM29DWS83UnkzeXdFT0w2NWk5VGNoWkR3VmZZUWRkaG9OS0x3a09W?=
 =?utf-8?B?SEpRMnFQRXNIaTBQNG1JYndHL2YvNVVRZ3NlQnA2YXlhNkhMNnV1S1BiK243?=
 =?utf-8?B?dmRyczBycWx6V2RBTU95N24zUEdhSTlzK2xNRC9EeUg4S3IzQzNLZ2hMdFVU?=
 =?utf-8?B?Y1FDR21CTkJET2tGNVhrbmtTK3lyNGF4dHhIV1FZYlJCbm56VW5QU0lIMm8x?=
 =?utf-8?B?ZkJGL0NGRHJ5SGFKOXlsSzhIUWVhalNJd0JCOFkzM3M2bkcvQU9UUXpKaWJt?=
 =?utf-8?Q?FZnAA0BHMIHB7K5h7ECkmFVkLdrPC4I0YZultwG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0aa298-6a7d-47c2-842a-08d8fb64912e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 14:34:22.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAy7CnSM5g8ZtTSH9NcTRpVRxSAJnpqD8D0IyTNAWQ5S9xiju3492/9f1nc0Z2Aw6PdMszjtQ/1/i0e+VgGu4ah/TqEZuXt3BZCUF8umXXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5167
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090109
X-Proofpoint-ORIG-GUID: NxAw58P_4uGNZlVC4shBjLy1jQqa_zt2
X-Proofpoint-GUID: NxAw58P_4uGNZlVC4shBjLy1jQqa_zt2
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090109
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/semctl01: Convert into new api
 1)Use SAFE MACRO 2)Remove useless macro and UCLINUX 3)Use IPC_PRIVATE
 instead of key
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

On 09.04.2021 14:55, Yang Xu wrote:
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
...
>  
> -	TST_CHECKPOINT_INIT(tst_rmdir);
> +static void verify_semctl(unsigned int n)
> +{
> +	struct tcases *tc = &tests[n];
> +	int rval;
> +
> +	if (sem_id == -1)
> +		sem_id = SAFE_SEMGET(IPC_PRIVATE, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
> +	if (tc->func_setup != NULL) {

if (tc->func_setup)

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

Can be the same as with func_setup() above, i.e. tc->func_test(rval)

> +		break;
> +	default:
> +		(*tc->func_test)();

And here

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
> +	sem_id = SAFE_SEMGET(IPC_PRIVATE, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
> +}

setup() is redundant now, we have the same in verify_semctl().

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
> +	.forks_child = 1,
> +};
> 

For the rest:

Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
