Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01D3D710E
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 10:21:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3470E3C9106
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 10:21:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F9313C5704
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 10:21:01 +0200 (CEST)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8D931140110A
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 10:21:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1627374059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=radQq3cyR90u3G5brX6+2XarRwNMUyOKk9W+e3JfS1g=;
 b=BIrfCCUDRrZZEYvQRR7raqiSoDk4b/p/uLKFRtXWHpJpWyrfeZ5OFzf3odF3t6PAlprRUM
 J+NG4lBUd9dcPz/6KcDEYixsn5i4s5hLiDsqI0FY70aALiIhimFDvOEYOMgtAGcsvEWp5j
 +DU31DMCUWIXXhPY0vaEkci+knd5i3Y=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-hKUYEfY4Pm6J4DG0b1juSA-1;
 Tue, 27 Jul 2021 10:20:58 +0200
X-MC-Unique: hKUYEfY4Pm6J4DG0b1juSA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFqtDINBpB30OxdUDUbSP5ax9AlGuZRpz1i0a/VeA8deuEtcpitWtcCMaIABnHZVB2kL11q16BudypkmLF1cZcsysDsgtbO6k2Nbb/0T80hiP+feHfKNhymgvTH1d54NVFUMlshib29V+scEJuAjGNvJwuV6eyq87tMMDbs6QoJOVeudxBwn5MOc0fcB7yFUonI6IJBBgqTi1va1Npe/EAmQy7drhYlo3SwfCASb4suif//7WWXlgl2j4Oxu95WJa2TT589CNJAQjAdk2tle5t1sYm8KM2wtrYbP5JDvdVQk8Phhu89x68r7go0tvly0+JbMLheypq+J+JDLeLYX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=radQq3cyR90u3G5brX6+2XarRwNMUyOKk9W+e3JfS1g=;
 b=NudC1HwAvBCeq5zuSxhV7P1BIDSndJARhU0t8PdnjzKm8NOT6dAeWqk1hcAjhv/yT4Kb4ILEORxQk3UHOlcl7cDMqsebz/0jeLtw5WdDKIwm5XAn5bO76H5YGeqHV1Ie+BsmkFnzMmCtoO9FF5baQa+gsOU9XKLh+2wN1YqcdERzTK8br2IHf/uIAAVotZDlgFc5o0x7yvte+GB4ElXd27hpcc6AgpqY6xahc6I4ovGGGICPc4bV8WO/PSXGaioetLskB5pW+ReDnJj0PMMlM5No2LEgUlvbf6fOLjyadhKo7AaA7YzwJv84W6U4dHjkVOuoU6o0VtwNR/ErRUTzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: bell-sw.com; dkim=none (message not signed)
 header.d=none;bell-sw.com; dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8471.eurprd04.prod.outlook.com (2603:10a6:20b:416::22)
 by AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 08:20:57 +0000
Received: from AM9PR04MB8471.eurprd04.prod.outlook.com
 ([fe80::39ed:d600:edbf:44d3]) by AM9PR04MB8471.eurprd04.prod.outlook.com
 ([fe80::39ed:d600:edbf:44d3%3]) with mapi id 15.20.4373.018; Tue, 27 Jul 2021
 08:20:57 +0000
To: Petr Vorel <pvorel@suse.cz>
References: <20210722063422.18059-1-radoslav.kolev@suse.com>
 <YPkjE3KHHnhYklp/@pevik>
Message-ID: <8b564e10-d87e-aaf0-03a4-1af347f02d4b@suse.com>
Date: Tue, 27 Jul 2021 11:20:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YPkjE3KHHnhYklp/@pevik>
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To AM9PR04MB8471.eurprd04.prod.outlook.com
 (2603:10a6:20b:416::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (85.196.172.93) by
 FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.10 via Frontend Transport; Tue, 27 Jul 2021 08:20:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0f2ebe4-ecdf-47a7-8120-08d950d775a4
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:
X-Microsoft-Antispam-PRVS: <AM9PR04MB88252948C07BECC719163548E0E99@AM9PR04MB8825.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INB/dD1yB5Bj+KZ4NrrvCU2bIOq2+C215080j+BoMI+omTQNT9oID7CjgFFY4F5Chdr3+jhRrzCTpanl7ZrcPnkiJNnENwOC/xL1MHqa5KeJpwH6KAx3nyEeBpBGMlc/puXtmDGSEgp8srJoGlS9374PT+NOc7e3f6eTyd6zFQXqUQSO1jyM48bjqSn55eqmljKulXRxaidSxN+KDTyL4Nzi78dYA1Ms6T0au3ojM8aadUPDiXLq8XjLPY2T4MXFy5EnBTJdgUGsRV7RTqOJBBf6ugtwJjSVH5R7Njj8ENdp5VCaGk58BmqNHV5JZFYKoKJpYJqoJu2ZDogrEWcj/MjT0lsOnFIUucmAXUlTq+bI5ng9uI7cnxzRCyfL+/Zqw0Bp9bu9XsFn4TktySs0K3BHUm9DeG0kgGm/UFabyY+BA5c8ySB3eezsvHCDWDRhReaC8DIPTv9MkylKJPprPks0seVujfxOtwk4MiBjtc0viEYSRa8EBWCm1ZXgkM0doNdQ6RLjhtog+v4D6K6W5qV6tcRkTjPIg20YQfYLDC5C/5trbNAzNJECZpfgc5J3Hg597u3etKcuedepyBvBAh20CTwTKviyX+BXh1ddvWhPwLkvQhICQoxEjzCKlj4ohWxLnmozEgasxv7mQvHAp4lJuLOo28keua89efFSea9k34nze7bGFKY71dSzwcpRnGNLgObifylq+/5sfJSh16qhfIkh9fY1A7XcIrGFua8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8471.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(39850400004)(376002)(396003)(86362001)(31696002)(2616005)(4744005)(5660300002)(186003)(44832011)(4326008)(6916009)(66556008)(2906002)(66476007)(36756003)(66946007)(956004)(8936002)(26005)(53546011)(6506007)(6486002)(38100700002)(31686004)(83380400001)(316002)(6512007)(8676002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGtqc3JuTllVc2JSbThRRTNNN3pibnBpN1YxSWJNcmd1TE5neXZsVTRrcXpw?=
 =?utf-8?B?R2NwNTZvMVhIMXBBczZjc2FuWjRMZ0w4UHBIelFzNVU3R3lpY3BWbzkwOUd4?=
 =?utf-8?B?UzB0Y3BSWmgvZXp2c09Iakx4S0RTMFpDd1NvZktaTTdCSFJCTjFOVmkwUHBD?=
 =?utf-8?B?TldyVnlFWjBFZFA3TG0yQWxNNW9ReGVFZXFpaXNCQkdkV25RbFRrR0s1bzdi?=
 =?utf-8?B?ZExEam5SMTFZcU1OSys1K0JYa3hpczR3WDU1bVMyTStGdFErREM2b3Y1Q1Bj?=
 =?utf-8?B?RUtIQzIwMk0wOHc4clZ0d3grTlh6RW9ySFdid1dEeFhiQjcvOEs1V3U2cWVF?=
 =?utf-8?B?bU8vUDRzUCs1MzNDdU01TXBWNEN4TGF4R2tGN2h1eUVLNTNoZGZiZFRsVmNj?=
 =?utf-8?B?NTNaMDB6STU3UXp2b1E4NkhiTWJJd2I3S0MzcjNFeDlScWNGVzAwKzZvUm4r?=
 =?utf-8?B?M3VlbmpNcVkrZUdkeW1pUzFNdXVXTjdVRkRnU1BkVzNKdEwxREtXemFqQnBq?=
 =?utf-8?B?R0ZZUitWdisvMGVwSDNRa3h3SUpheGJNMC9UaG5JSUdDOFpPWlNKUU91T214?=
 =?utf-8?B?Zm91alUrN0JqM3V4a1BMUnRDdEY1V2pleE5UYTJLT0hQT3dia01KRmVKZ2g3?=
 =?utf-8?B?dWo5eXBHZ3QzMUNPSis4b0REcElUUVdwcEVHWUhjbjdGMVd0RjJWbzU4VFVR?=
 =?utf-8?B?dlNQTS9KeUF3YUpYUkhWTnJ2aGVnZ1JuUS9Tc0tXNUNpUkd6ME9kUkg4VVZX?=
 =?utf-8?B?aE1GZzBqNk5adUl4KzJDd1FhT0pYejVBcWhPK3RzNW1YdVdYM3RSYm5CNUY3?=
 =?utf-8?B?TVRPd21BQkpQb1RCRGdiRlFWR2RiQURZTkxoQnhLMW56bU1ES0t5YTFWZ1dn?=
 =?utf-8?B?eHhhdS9qWXNNb0piZmlMVmxCOW9rNjJCWks2c1FPeGtRZEJ6V3AwdkJXY0ZG?=
 =?utf-8?B?VFZqcmtjcHRvVGtOdjFlV3ZiZi9mL2taYjFkeDk1dHdBUFB2N2xDNnpENDc1?=
 =?utf-8?B?NVFPcmsrTXY3R2J2WlFVZzAwQVFRTDhWaWRyT1gvZ1BhYXhVdkx0WSt2TmF5?=
 =?utf-8?B?eW5leC9YeWhFY3F2cGk1UjRNejIwUnhCd2E1c2RFRlFaZHJMQU1HM0N4dWtL?=
 =?utf-8?B?K2pSd2EyOGVnMWJvNER5OHhIRXgxemxaYmZDRjdObEM3aVJaZkN5SGZ1QjQ2?=
 =?utf-8?B?WUMyejhEK3RZeFEwQSt5aVhXeGJxZkJZY1dOYkNWYlozeXd6NXVGUmZtbmJy?=
 =?utf-8?B?Smg3bExOUm9POEthT055VDZoU3VWdDJ6WlNsSWllbDRUM3ZuMTc3dEhZbVc2?=
 =?utf-8?B?eDJwVTQ5NTJtYXJBVEE4bE40bjc5ZHB2MXBaOXZVNWxhY3FIc2ZEaC93eGRz?=
 =?utf-8?B?QWZVMHBMUW9hSXZJdVB5NDMzN2ZJOFIzd0hqUU4wd2duQXFObDkwbndSa1V4?=
 =?utf-8?B?STBzTytzaUcvTmcrNWpzdVc1RXB2M254NUQvRy84SEdFSzJWNVdzNnozOEhN?=
 =?utf-8?B?STRyTFhxRTd0dXNHdldTSUFQcDVKeHlaaStIRUE1SVdJUjY4ZzVwQlBWMUZ6?=
 =?utf-8?B?REFtM1FweS9FQjRGeE9hN3ZNWHN2SkZ2emF1SGlialpTVzc1VUkwMDUrRk5s?=
 =?utf-8?B?UVNKVjVUVGF2STdJanRvTkE4SDdaTWhWbGZZWmhSbThtaHJSZmhqUGRtNUM1?=
 =?utf-8?B?elNaa1AweStwbmQweU1KWVBJcWF2WThSc0Q0dFRHak9GUTJVUFhTSlJqaXYw?=
 =?utf-8?Q?hng1rmMUCxs817gk4lZMfGLIUCKis6f6xff6ipY?=
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f2ebe4-ecdf-47a7-8120-08d950d775a4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8471.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 08:20:57.3343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qumKrJJS2J5lPcBdIOZs6u/pt1tL0SSKuNPJAuPRXaItszHaOexF7nwYUfZgRPJO4EoDUtD0568P5TiXoMyR6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8825
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] lib/tst_test.sh: skip test if ip returns
 "Error: Unknown device type"
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
From: Radoslav Kolev via ltp <ltp@lists.linux.it>
Reply-To: Radoslav Kolev <radoslav.kolev@suse.com>
Cc: radosla.kolev@suse.com, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/22/21 10:49 AM, Petr Vorel wrote:
> Hi Radoslav,
>
>> In network stress test groups there are tests expecting
>> CONFIG_NET_IPVTI to be enabled in the kernel, and if it's not they
>> fail. There is a check for VTI support in the ip utility, but not
>> for the kernel. Skip these tests if vti device type is not known by
>> the kernel.
> LGTM.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks for the review, Petr!

Alexey, please let me know if you have any comments.


Regards,

Radoslav


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
