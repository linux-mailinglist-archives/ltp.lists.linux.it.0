Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0EE2EAA58
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 13:04:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6788C3C31F2
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 13:04:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 69BC63C232A
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 13:04:47 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D52341400E05
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 13:04:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1609848286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2dbm7WNP1qJxCxnd88atdKIWuDEj774nUBZ6Qa3h2Q=;
 b=N/d07w6I9i19LlW5mwsDWeRDelixcQaFRi+TZkqTdlDppbs8BHNjOsbm7tBnK4zUoaAJEj
 l2/TTNSyeqsaAChHXAYdKbmaZHrytOj3Nw7S/egpbYQBLt56MtsbK0P1pMjiwtiicqFoFj
 i/W3SkGv6DJ3TBiRIa58wSVRTZXOvxU=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-XSYTG8nyMWiJ-XtgzLKnGw-1; Tue, 05 Jan 2021 13:04:44 +0100
X-MC-Unique: XSYTG8nyMWiJ-XtgzLKnGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNDOKdR9/hGdYqrzRQc3xmtvRFmZmTgDfx35gXGuBorRmyfG7fE5Ce6MbgTnCoTRJov8cCJ+46jAW/khEPOrSv9duY2qCswFbbjQWl3YoBrVNQjP3f/Ws3t96AabVXbT7JzsqRF0OTOF5rxKR2s2YTAXhvHGY7Wdz02AjKp9Vz+XKS140kWG3K42cjwr84I6DvdnWRDDwxcOXfxW+z3GP28jNW+1bA0jYDRIzPsmngf3TUfCltNuMyX4fIRChJKRZQQXA6DYgHwlVxv2oeNYOKd91jx9YPjjTKuZZQY2NQdcMPcvZq5Ad332GZCsWWgpO9jdlXVPQZMkZM2a2qtfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2dbm7WNP1qJxCxnd88atdKIWuDEj774nUBZ6Qa3h2Q=;
 b=cPQsgc8zYxGK802PJvT6BcvP8Oxh3+xisqp/gHxydiUpbQvWUNnmsPrz2EqnZ446ByLXDNn1Nm3+PwTxU8kttCLbPlbZ5LLJ65AlhJFyt+8/PYGr45nOkXusiBuKE4oNBPMxdFxb5BbyYdCDKnL9sdoAtSB+7p1U3nxJ1Sp/3hvZenqV/iGzB+UmiKRDaNbY7EIa/yjsQXEGb48PU4CXkYWIpCsyUIND/0xWpO0vRoevs0LI+bC4o2SgkNQG95JykWD0dU+PHGTtInSPBQSREfSsxK4aQ0htjBjADe+dwFX5PptdvwFjX4bFgsu9gjdF+IHPx9Xx1ekXiBCo8vlLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB4288.eurprd04.prod.outlook.com
 (2603:10a6:803:3f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Tue, 5 Jan
 2021 12:04:42 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::6440:e647:3e17:95e9]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::6440:e647:3e17:95e9%7]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 12:04:42 +0000
Message-ID: <beaad85cf7eb0f7c5e80f35f34e348b5abb03d98.camel@suse.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Tue, 05 Jan 2021 14:04:39 +0200
In-Reply-To: <X/RJhbNBfja6/Snr@pevik>
References: <20201221110120.26165-1-radoslav.kolev@suse.com>
 <20201222171033.GB126602@pevik> <X/RJhbNBfja6/Snr@pevik>
User-Agent: Evolution 3.34.4 
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR02CA0170.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::7) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (85.196.172.93) by
 AM0PR02CA0170.eurprd02.prod.outlook.com (2603:10a6:20b:28e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Tue, 5 Jan 2021 12:04:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a78ef2-e27f-4386-1d1d-08d8b17215ec
X-MS-TrafficTypeDiagnostic: VI1PR04MB4288:
X-Microsoft-Antispam-PRVS: <VI1PR04MB42885C030A3109A36C7F2BECE0D10@VI1PR04MB4288.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ot8HuQTM94/hNfoZxo2iWydzT7zHJ6ARY4s2pqcIqah4IzW9UcYYUKEHXkN2bgZa9X/VkwnAInH7NXm0buliwU8ROld8Evb1t+qiE2hgCOwG/ubnyWEnpqWrTUJBXTVSJS/6g97dDaJ4caIdiepCOy/8hdzxswqW6+y70KMlnIsfgW9RmJJaKdFlGp4bUpdS8gPWDZ47bApZFzjCTErPYOORgd+4j7RCbi2zkQMmXVXwAkiRFYi4PO9jGk/ak1nqno2Kh5aCPLdyTHnaJsNWLJqBDVmEJVPtjU4uYX81UEbKHJPrSCZpVWAecXnFgvtGhEuyECr4U58p4wpXVZVqIbBERflig4cRyr7N/hRbBE2ESR7LIu7L2xrDEadHHpk8ilVucQJvTv8HVChstwBdfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(396003)(39860400002)(16526019)(2616005)(956004)(186003)(8676002)(5660300002)(478600001)(4744005)(66556008)(2906002)(316002)(52116002)(16576012)(44832011)(86362001)(36756003)(66476007)(6486002)(66946007)(8936002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZnA4YVloY0dEMytIb2Z4dkpKNzducmphUnQ0RDljbm1NQW9IYWRyL0QzYWRQ?=
 =?utf-8?B?MkZIVzcxSTBkeGgxNVFycTV4YXJiMEk0Q1RlU090QWNUWVN2bTI4cUNxVGdn?=
 =?utf-8?B?clhBVDdHOHVnZmo0ZDFnY3lNV3ljb0Nnc2o3NENCVHUxS2RKR3FRajVHNnFQ?=
 =?utf-8?B?YkNFNFNmZmNrYVdKZWRMUkJOL2EzVWdiMnRhYzVFcDJGa1FnUmc5a2lwVzNV?=
 =?utf-8?B?alpBSExmazdOR091ZU5ZYlVjS1hCL09PNWtRN0gyYzN0MExTcGVWVUJVd0xJ?=
 =?utf-8?B?OGxva21IYnZTVnRhMW1CaDY1ckNtb0FVYm1QSXQ3ZnhyVXFQREtGQmpzVzBR?=
 =?utf-8?B?Q1N4OTB2QVpPTnIwYTdCS3Z4QnRKUytGSE5vNEg1UE9zcGZuYUcxRzJ0VHh5?=
 =?utf-8?B?REpHTm1obHVsR3JxWkw5aXNiNENuYkRPN3NIWFF0WjJSaXZ2bjZ0WktOZE1t?=
 =?utf-8?B?YXVjV3NENDQ5UHRaeURtSGlNbkYwU0toRVFXZzRZaDV0Vkc3WWRYd2U5QW43?=
 =?utf-8?B?ZFhWaDk0eVpNNU9ydXBVaFJ3VHJYRzdtYUZpRUdseWRFYXhXcytIRGsrVWtT?=
 =?utf-8?B?R3lwbUJybUw3S0dIMy9RbXlvNDI2ZUVjbUpnVXE3T3Y5Y01admlERFBleXM3?=
 =?utf-8?B?YklhVVQzRE9BVzJ5SzdrUUNvek01eVNvbmVMRUZxR2V1YldwdDBRYUIwTjZz?=
 =?utf-8?B?Qnp1bFkrT1lOa0c2YThuN1R1dlJoQ3hFVjZUTm41c2U5WHRJQit2Tk5BRjF3?=
 =?utf-8?B?WW9mSVRnSFBYd251cThzWnhVdlZjWUNhZWh3dE54cklxUXVOS3E1TFhmQXFY?=
 =?utf-8?B?Qk9aMmUzdFNJQTA1TURQaTJnSHBLYWVwTVducm1ocmdTaVlJKzlJdDRzRnV0?=
 =?utf-8?B?R3YzSVl2MnRzQ3dMSGQ0TjlqVGQxVE9sVG16WXJRVjZsOGcrVHNKZmtia093?=
 =?utf-8?B?Y2o1YkFLY2RkTUk2R2x2VGQ5SU16bUc3NVFqMldpTHBERWNyaURROEtlczRZ?=
 =?utf-8?B?OXIrTEV0VFFFMFg4Wi9EK0tyOVNIR2t5TUZnUWpxTlNmL2xNUWtXbzJkU1lM?=
 =?utf-8?B?TzhMZW5TbWFIenZNNFFDalY1MDJRY3BNVTk1cGV4VE5PSVZjRllCM0svaFZM?=
 =?utf-8?B?cjB2L2krekxaNXZGZTQvanV2L1ZIQ21qTTB3VExRbHlYUFNxYlB5QzhobGc1?=
 =?utf-8?B?T040WGVyVm9wZnpKVjZqTzYzY1hkZTEySVIrNTByV1JxWnZmVVN3aXhvQksv?=
 =?utf-8?B?ak9LQnV0SFpKZmF2ZzlYa3pyaytvTGplTXVSVG5pbnlKMjh1V0cwaW1HenZi?=
 =?utf-8?Q?IXODFhRqb5pwdFJ3Z1JpDNFSPKqsW40q7H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 12:04:42.4269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a78ef2-e27f-4386-1d1d-08d8b17215ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3lPtPYfTmXLSmyKIi/0gPBZhYxn05CGiG2czM6iwPxd8t7ahvEOZmkxoPr/aTyUIzqaoztthR1XaFrActmswA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4288
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpio_tests.sh: Fix failure with BusyBox cpio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi Petr, 

On Tue, 2021-01-05 at 12:12 +0100, Petr Vorel wrote:
> Thanks for your fix, merged with these changes:
> 
> * grep for BusyBox because some older versions does not contain the
> hint, but actually require it.
> 
> * move things to setup function due my following commit, which cannot
> be
> outside API functions (setup/test function):
> And check for -o (which is on BusyBox optional).

Thanks a lot for the review and fixes!



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
