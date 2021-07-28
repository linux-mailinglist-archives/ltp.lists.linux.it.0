Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F03D8FFA
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 16:01:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 155E33C902A
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 16:01:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AEF43C641F
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 16:01:01 +0200 (CEST)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AB46F600040
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 16:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1627480859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGtMXaE3Qm8Nxbhr/l+xAnztKpQSWnQjAE2lSjD2aOw=;
 b=Byp3VCFJz/1zXS+/UCA3Hdas/hqgPBYCXAFYJTzm+x+mRTx5nG+kB92FzHNAGMm/Cl49hP
 UgovJrhYFExbJexSVcyWypplCkujmHjoHBb7508J5FmiSMNnou7VaIAp4R1ap04pbdEYUw
 LjwznZupNcRLhpm3tNO45tg+7XeIuj8=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-5xakyhmDMbSuv-KL9nG98Q-1; Wed, 28 Jul 2021 16:00:58 +0200
X-MC-Unique: 5xakyhmDMbSuv-KL9nG98Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGAmeHrdYKOszsgCoYcA/qGv5HMMeUcxHR1bM5Lbe2PtSnNMdTIH3d2rHnxQhmfL8RBkNfxA2y1P7rahlul8xCI2OEckTTSIJPdu9pmCzVZ+wk7s+9JrQ+0RtoCZJa0P4CMykrSVxF2MeTjnFY6y55aZWvtCp49LaUXjyR4dZUg1lSUndKHI5GS0BdJMuTv/SkEtzm0d2yiha4dzZVwaV74dwP2Ua7flEQhcaYkI5LRCNQDvoswGcaW6Oi6IK3qq98jG/qVsLdAfpXCm6FdKmJMMpndHF3WORLqpUPHO/k/hvyaD9ORt20Bf8x/3yKbaMIh6qZifyXyTTuUyUAftXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGtMXaE3Qm8Nxbhr/l+xAnztKpQSWnQjAE2lSjD2aOw=;
 b=VRxeiBR52ScIbJVeTRnjYMGNzwPJTd4EbEQRilIfZzoyesBePxAEXAKl1WIPEqNw4Var+InLwb/1iZsuV4enE00kqTYFQkXCpXSzOh0kQ4j/E1q22aYXRPIKspiMa0/vC2o61NByryZfhK454xpbrikiwVM0A4mRw9gQ1dW51Bcmg4cunQjs27ZM4/IC2uIE5cRXnq+iHWSaV/gzjV7gGMosw/bN8nQMpgt6A3glv5DeB7FTEf4Duy42F4dF0R9YAW/8tGaS7O63Tg7MgrNNqjVamZQRfLtDcW7iWO7/PdcESKUT9obm1D0Ydx/6h5OFdEIBFIb2itKBBbmNnTUmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8471.eurprd04.prod.outlook.com (2603:10a6:20b:416::22)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Wed, 28 Jul
 2021 14:00:57 +0000
Received: from AM9PR04MB8471.eurprd04.prod.outlook.com
 ([fe80::39ed:d600:edbf:44d3]) by AM9PR04MB8471.eurprd04.prod.outlook.com
 ([fe80::39ed:d600:edbf:44d3%3]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 14:00:57 +0000
To: Petr Vorel <pvorel@suse.cz>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>
References: <20210722063422.18059-1-radoslav.kolev@suse.com>
 <YPkjE3KHHnhYklp/@pevik> <8b564e10-d87e-aaf0-03a4-1af347f02d4b@suse.com>
 <8cc8d5bc-b651-8e15-6389-69f36cf6bb49@bell-sw.com> <YP/ZxhYSZb/NusUs@pevik>
 <c94e1459-07d5-ceb0-f113-9d3f57343983@bell-sw.com> <YQFWT/0MBcZsLNVV@pevik>
Message-ID: <c78c6b1a-2793-de86-a263-5bcf58ab41da@suse.com>
Date: Wed, 28 Jul 2021 17:00:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YQFWT/0MBcZsLNVV@pevik>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0074.eurprd05.prod.outlook.com
 (2603:10a6:208:136::14) To AM9PR04MB8471.eurprd04.prod.outlook.com
 (2603:10a6:20b:416::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (85.196.172.93) by
 AM0PR05CA0074.eurprd05.prod.outlook.com (2603:10a6:208:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 14:00:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bcf74f0-c4cb-4c14-9bfb-08d951d01f5e
X-MS-TrafficTypeDiagnostic: AM9PR04MB8633:
X-Microsoft-Antispam-PRVS: <AM9PR04MB8633AE68371D6E5555D15369E0EA9@AM9PR04MB8633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6zPBTlTcs7Xxi0KCS5jQZUjAcTn8Bbxt+YWT5xCkOdctmye1GDAAKebTc7dUJr/uR6/9VzQfDdQHalADd5ijoc0F3F80/6LLJjOzF6Ni1up2Q4ISXVuH3Zr9G7NurJ4MoLDIKPL9fNQGBtfF/ZSxtYgCTLSFliGD8uvs3vIXZbNZ15yjmTIkN2ARWDvu3fcNwOR1ES2Poyx3YLwevuQVzmxZIJIslhZOnYn3qIfYvffbtvdreia+gWNWIT4LZYaEg77AqqMZAoTfoJp2KOUqQ0WxBUEQHNUj61WbTJaSdUH/ZhSsee3wepOBLdSHwpqVgrwhP479bPRZa7Ux2fvr9d3hedfFG2Eo5chYYYW1TnjTMrFuBelqJr116T7yuHvr/nxadJmEpcE4sbrnnIMLMaWnf+J19x5siQLpWn3cZ7KP3Zi7QyUiagt3OlGcUhQ9Ofd2DaPaWolJIGrPG2G+vYAMouUOO0HTjyF9A6TtocZq7W4bFPbzsB+EE6ZxBY2HQGcdBXX0w5KT5QIhCrK6UmN6QMlYufNHeR3XcvwzQnAp1GpkryndwCydt2PaasGDXaawAVEJZwYHpdGylXcljOvyCsokhP1X8o6U1ABKVeJPE0E0dB9iWYl70kdBTjfy6g8xcfFPwmjgDnPicxsTwdJDE+eFn2aLNQ2TtGZ0WUY5TrY8UyX5lAMWL6HBP0rWlwQXxKqQQ4/s2ou/9SvrywXAiBN/rkCuGSJxM5JVnlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8471.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(376002)(136003)(8936002)(956004)(38100700002)(2616005)(110136005)(31686004)(478600001)(6512007)(31696002)(6486002)(44832011)(316002)(26005)(66556008)(86362001)(2906002)(186003)(558084003)(36756003)(66946007)(66476007)(53546011)(6506007)(4326008)(5660300002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmxMeWxqVHF4bmpsQ29UTkRxZ1ovZk5QZ2t3WkRVTk9xNk9ER1R3dVFBdXc5?=
 =?utf-8?B?MnNiT0x1c0RkTVRXbTNnYTRZYllRcGtQMzFvSDF0NmcveC9RdTFlSWxTZWxt?=
 =?utf-8?B?cEtLMUZmUUcxVktLa083MG4rN1JrREFuMkJvN0JHNFdNbUJuT2IwYkRKMVJt?=
 =?utf-8?B?UmJlQVNpRmVCaGpLalJvY0ZiQ05UOHUyWkFCSys4Z0JNWGtkdG5ZUmpGTjVa?=
 =?utf-8?B?MzJsNGtOTVppTDBsL24rbTlmNFJjZ1hqSU1zQktha1Z2TzVxMnNEelYrZmxN?=
 =?utf-8?B?UG0wcExWdDMyL0tramoreStQS0FkSy9RRFdnT0w5Q0FLRks1NnBVb1hWNEtG?=
 =?utf-8?B?VjJ0NWMxS0hUY1puamFFSFY0eXZqSEN6dnJQK1A4aCtJK1Q1VUNwc3Y1R2tn?=
 =?utf-8?B?MjNKdE5yUS8zRXFPRVNFNFpEYjR1cWlQYnMyNjBUZkMreUFpN1BxenZlQkhi?=
 =?utf-8?B?eFJnRkFiSHpiSWsxclNGM0c3N05CakNNeUt2YzBueWxqS1JUMjJrTkFoc3lO?=
 =?utf-8?B?V0R0ZGx5Nk9JTVd1WTV5blhPcXoycjBvV2NmSkdiUVpkSk9qYnBweUZiWit1?=
 =?utf-8?B?Mk1HcDRYL3BLQlAvcGtQc0JsTU9FNVNLS3BqZVRrOTlkaUlTdStPbEYzVVdU?=
 =?utf-8?B?eFVSbmtnNUVldnR0K0lxbExpYkNsMTVqN2l4b1BXSmhyblB1enNrWFRHaUdC?=
 =?utf-8?B?enhqTVhqbm8xbTFTWFdNblRTSHdGRjF3YkdHNVl2QXA3L04zMjM2OGdOMGhH?=
 =?utf-8?B?eW9XUTBTRS9DMzJkSUJqaENYb3NqbmozZS9aclZtTFIrUVZyYkhtMExOL2Fq?=
 =?utf-8?B?Q3RCckJwaGxVNzdNcVFHdXVEK1VSUDlJRllzSTVMWTZwTE8zSUhsWmNCVEVB?=
 =?utf-8?B?dG5HVmVpa3hUVjBpTkxNZ3NBVElmbDc5d3JYVGFUS3VPYk9lTEh3R3lvbWE0?=
 =?utf-8?B?UDllL1g1dVZHVFd2ZmZTTlhYdTAwdEwvMFdtWTRUamdBRllRKzJOWGM1cExW?=
 =?utf-8?B?Z21UeWI2eWZCQUQ2a1ZCWERmeFo5bjJyR0Y5WEh2VGhwSEFaenZBbGcrY0Fh?=
 =?utf-8?B?TU1WRVZaQi95bkFydFdnckRYZjhIZ0R3WGtXUnVXRTlod2RIYWQzSlU0cnEy?=
 =?utf-8?B?bzQrdmUydGxXUUVwTFM4VG5mdGRYN1FGWW9VNDA4dGd6dkEwUGZNTTZZWExt?=
 =?utf-8?B?NHo3VkFDNVpWeUVwTWllWENmMWVQV29jMTIyUjF2TzVVc3lqMWZucitnWUhu?=
 =?utf-8?B?NjBUUlZaSDJ4VHFiZ1U0bWEvbXhzeEtaMThKVTNxZExQQXl5OGdGa0hEOXdH?=
 =?utf-8?B?amQ1U1lSclM3T05lTUdSS1dnTG5ZNTMvalNuN1YzRkZNUjZ5Nmp4QTVndENm?=
 =?utf-8?B?NDhKNEtHd01TVnQwT0JybHVEOGV1eHBRQ2tpelJ0eTRpZTdBaWx4bm93djlP?=
 =?utf-8?B?d2kvS25HdDlBd1F4ZUlSK2VxTWs2eW1GN1dIZkpKaGVGVjk0M3hIU2p0dXFk?=
 =?utf-8?B?WUNmUVAvZWRuV01ESXFRcURPQXRFVkpCd3RQRlhtTm1GUHIxSnhxNEdpL3Zi?=
 =?utf-8?B?V2xUaHRubitkVmZHelpYN2xwOXZDWGQvUEppTmNsbnhpV3k5TnRiU0V3Y3Zp?=
 =?utf-8?B?Q1oyTXU5ZEV2dm9OMGVmdHRhdnNXUFhwU1dDVmR5bFFqSnM0RGUzK3UrSVNQ?=
 =?utf-8?B?T3p5Mzh6UC8zK2ltM3NQUTdKbnFnQzh2S1ZDVTdBUDNSUTNrSE8yZExvMURU?=
 =?utf-8?Q?NUbyaSdeRUZLCSPdcLU9pJSvPpKe36m8gXwfjdn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcf74f0-c4cb-4c14-9bfb-08d951d01f5e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8471.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 14:00:57.2281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjvU9K+LjHM4hBTG/PuAjoYNoywLx2EL7Khi8dAtfMYGpXk0SiUURYt/R3/OYDhAlrwAXTJMRF+JNgrP7dGwWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/28/21 4:06 PM, Petr Vorel wrote:
> Yep, that'd be safer. But your original proposal to check ip_vti ip6_vti
> is IMHO the best solution. Radoslav, would you send a new patch with it?

Agreed that the proposed by Alexey is a better approach. Yes, patch is 
coming.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
