Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BC354D90
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:14:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E84383C1E0A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:14:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D07A3C215D
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 06:39:01 +0200 (CEST)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 45528100116D
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 06:38:58 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYnsDLvZW9ro+jlUI4L1GcBbHToGP+TfKiS6YXLy+06PbaPUViBWZqSHzAZ53oh7bF3pNJ8+pjD3TTnt37ZMShDvkNBxx94SVa10o3asjCe+ssZFqHSIUukQdA9uhyU/JF1CXISytyHzfdhX/kEFhvNYMo2pqRCjV1PbVGyTqo1jxSnteNsQCLlLeyr1sQOeRzXbNJHr5NEUYgrrmhyFzoAwFbt2wtLtHTCcQB1VzbJlvg2+4rbKXbNjhBx7uXKiRba60xHtYPsMwa5lc7zyf0lA+xXYkpoZndTE89QQYB7DnaEmVEW7/FbF5PRvf0lOQXkp3rGFE2MABDbOdFgtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80xq3fg1Go8O+dv7+XRNAiFgEZB5HUWxIc4erkm990M=;
 b=SBTFo+Xk+g5GpfEmyPbFc+tXW64BSFHhhTTbtVySpaFYhSqOGLbyqIZtdvvnFzr5hkoOulNvLux5WW5HilKfC+dIlitYwtpQm43BaVgslO62a9XQH7ONGlD1xaqWQcTXG5eipKL1BNcGerIE8Rm2aJMIzPdyv1e52WKOVXDvOK3029dhYTxvYwtNkf0n80UKY9oTdF1LAt8wilH31Pwl704Ges8mRoq8eQxerRpCgdn0BcKTkGyLPS4g+nO94KSBHF3XXlwtDPsL2bD6pAl0lN1B4eLWB3r9YxEn3VbqqTfDIJWqaKCr0S94Ljbv3JwvYFX7kpsinE39zibB3HZlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80xq3fg1Go8O+dv7+XRNAiFgEZB5HUWxIc4erkm990M=;
 b=Wqb5FamrPThVqv4RzYe9un8J7JgxHnHQM13pdfHvyiBVJdfnARvcpzIbEA8+5gXLcsmPAJd78LIIc2vsyxSfIufTOmA9doeVP8NXPIv4iT7Bd9ZrqmOTZfApVO3pnv9YUE/IV1WFyJxtjfVpXv7Tpdg097V2XGmEs1/xn8/Ke50=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=windriver.com;
Received: from MWHPR1101MB2351.namprd11.prod.outlook.com
 (2603:10b6:300:74::18) by MWHPR11MB1264.namprd11.prod.outlook.com
 (2603:10b6:300:27::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 2 Apr
 2021 04:38:53 +0000
Received: from MWHPR1101MB2351.namprd11.prod.outlook.com
 ([fe80::c156:455d:860e:ba87]) by MWHPR1101MB2351.namprd11.prod.outlook.com
 ([fe80::c156:455d:860e:ba87%4]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 04:38:53 +0000
To: Petr Vorel <pvorel@suse.cz>, zhanglianjie <zhanglianjie@uniontech.com>
References: <20210330021830.17402-1-zhanglianjie@uniontech.com>
 <YGVkS23e+/eytuEn@pevik>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <8927deb1-a21e-637e-a355-4f25ba027a51@windriver.com>
Date: Fri, 2 Apr 2021 12:38:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YGVkS23e+/eytuEn@pevik>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To MWHPR1101MB2351.namprd11.prod.outlook.com
 (2603:10b6:300:74::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.175] (60.247.85.82) by
 HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.1 via Frontend Transport; Fri, 2 Apr 2021 04:38:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d8b444-bf8d-4d7e-cc28-08d8f59137e3
X-MS-TrafficTypeDiagnostic: MWHPR11MB1264:
X-Microsoft-Antispam-PRVS: <MWHPR11MB1264EF801A30FB2884D466638F7A9@MWHPR11MB1264.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbC+V3dgxC0XxqQbGCdhwEI3fuoAm2zJepjYmGxkcSF3aagHLnSArXNMGziwTadfCcMAWFqjlUx92/1i5QVscDtEc0Ludy/EiH2cnVLqGwOCGKgazI9fiVlRyQvaIUszP3Gwl34Mjv9n4Y2f8qEW7uq73pQuh17AkT3leygNyqzx3TI5oi3MGPOM9z7tzrXzmsm3+f6ye72d/zuEr7F59hPLIZb0q5Pem097fq8E2ENh9m0zMnoFApLHE0Nt9XaZP8IOWkVDIZhrjnZ+BnI3PcSrztZweeaQBae9fSE0Xv5mLXM4CYmiY88hMKvK3dCzMWbEnlHL7mZO+oTzXO2663dlTpFc6hwPWvsOh7dlQNwu8HGYjKYwKc9DmGBDbOyabJbLkhOJR4tfZMu3fMPeYZdzd1FlM+8w97Eg4XFVqG5RW74bRRwkaaUtU1FApimLx8UeTYJwcC/svhcREoEh5FJshm6CF7LjzXQDhoHOuPsf/tIkJm8ICXXUGpFbtXd2tkdcrZEg6deCvNi1CylYFxmo8T7kfW4pAoJyqLyLdYl5mxxhBpuvrahL7wcDwzQaPcCEIO8KpeZx625xd9W8Qd+1jfANcpepdvzw9vu9eaxf6G76FRsA3qP3aUMkSzYjT/9O8ET/dmQ1hMLzXqtWXSHJFPBU3ydb4Idld2hFp0yau1/lYB37Sd/A+KTM0BjQhNUl7J3FBiXv+dLSRPsuoJWHExC3mTUIRUIUJ5Tkr0VQbMDqFUNIH+Fn113xqVY6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39850400004)(956004)(16576012)(4326008)(66476007)(2616005)(110136005)(31686004)(66556008)(478600001)(52116002)(5660300002)(6706004)(26005)(66946007)(8936002)(36756003)(186003)(53546011)(6666004)(38100700001)(16526019)(31696002)(8676002)(316002)(6486002)(86362001)(2906002)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUpRenFiOU5vbmhTQ2NPcURCWkdDUXlOSVg0NndXa0IxY3VTVUx3dkw4N1Vm?=
 =?utf-8?B?N2ozcjN1ZzFuVmIzN2RXaHE5K1NSWUMyZG9QSWxGVjB1MFpNdjNGWFBDWXNi?=
 =?utf-8?B?MENkQ1RnK09sZ0tDMGpBNnVGQVNqNjMyOFhBY2FIQU4xUHhBTlF5VDh1b0Vx?=
 =?utf-8?B?OG92aU4veThpMXdvalhGK3lVbVpUTnVtUTlqeXpyZlF5Z1VKT1A5cjdMa3lI?=
 =?utf-8?B?cGVvb3ZOSHpoaXZaOUxMMklXSjNNNTFlRC8wZnNFcXprOHp3aHJWY2hlb3JH?=
 =?utf-8?B?S1FlcVd0M2VnS3RHZFR1RTNRcnl0SzNEZ0hmR2l2R0ViTEM0RkxIdHlmRXhv?=
 =?utf-8?B?UWwzREN6bzhNR3RobUtZU28vVjdwSUgxaUxybzV5WksrSklDMk8vSGNKUFc5?=
 =?utf-8?B?Tk9hNEFPZE9yZUF6WUxFTHh2Nkw3OTluR2ZkV1lraTlzOUhYUThJS1lPMk4y?=
 =?utf-8?B?VGhhMkVhUzAvcDBsRUxBNW55ZmZwVktLd2F2QmRlbUNDOElua3F6VjQ5RHBS?=
 =?utf-8?B?YmlQOTcvK3BPN1BWZEpSbWs4OTlNZnR3Tmdqdm9tdGFmM25YcTg2YXcxc0lz?=
 =?utf-8?B?dVIxTWFRTFNzS0dJUjlGRG1ZaTNFU0xuR2REcjI4dlo2R25IQ2dSTmFnaGpw?=
 =?utf-8?B?WXhRejFXOEtPN3k5ZkdrdVd5cVpsRkt2NDF2eGJ5MzR6eEFIM1l6b21kaTBQ?=
 =?utf-8?B?SU41RHpEUlFCK0VSRzhwNkM3ZlhmMUMxYVFiNWdub1FhenRFM0hYdGdXc2xW?=
 =?utf-8?B?Q1VUNEZ6NytBVExGbEtiekU0OTcwRHNwS044ZTB0WkZxczZlUlhsNkNBRHJ6?=
 =?utf-8?B?cUNHL2x6Q2dYa2lyMGtnMDVGdTF5T3AvRVUwTlo2citwWFZNTlFqYi95MVQv?=
 =?utf-8?B?MTRBd3hwaGV6bXpoRFZGYUpXWUduSS91VnBMcWxKN1BaTjJCcUFnMkdUWmRz?=
 =?utf-8?B?WGxzZGVSVFZYQkVDVDNhbUdUdTJTcmJaenNzT3JMWjk1SGxpZGpFRDdTRnVF?=
 =?utf-8?B?UnNKanlCa3BYbjI4dWNIdGRscHp1VS8zdS9hakhkOVU4YkV5SGxuaVZUNE9m?=
 =?utf-8?B?Zk90NnBZdmJwUVRkKytZVjlRZFNucjVyMDFNMVVOQUtyOEJUVWxzempTL2g2?=
 =?utf-8?B?OXVtWFJKeGd3R25nZ0Y0c3RzeGV1N1ZKWmJBRXRTTTF5WUdWbFVxZTQzV2JR?=
 =?utf-8?B?TEsyMFBsd0FtZGkyTGMzR2xHOWozM1VjSGdNOFJEQ3RkNUZNZ1BYak16TU1C?=
 =?utf-8?B?a1VHaysxYWE2K0JNU3JOc1Ewc3FJRURRdm1LWHhzSEQxQ3pMT1RRbGtQL0tE?=
 =?utf-8?B?Zm1sNUVYd2kvQ2ppVTRRN1JmUE5OZ1lPemxPV2tTUXFCQjRZd1Yxdmd0UTVC?=
 =?utf-8?B?aE1jS0tybnJ1S3ZLemtjaCtiUkhwSFdjNWVQamtPYmhDLzQ3aytnUWdOVGd1?=
 =?utf-8?B?YitmcU9TQllZV0lROUd0elpHY2J4ZWZBZnFJTDdKb1BIV0NFNVM5anBxeUVY?=
 =?utf-8?B?RGw5Y281YVlhZzBXME5iQUNXb0sySkFJNGQybVd2MzBjdmlDOHpmVENzOU5X?=
 =?utf-8?B?U2I5aFZ6cWRzWkhlSEhDZEtkZkNIYkNJbGZQaGlYOXdmbzBRaitGSnRjWFJ5?=
 =?utf-8?B?RFRNRTZCL3FUa0pTYXhzSkNYTVRxSzcvaitJd3ltbDcwd0I4eHVjUnBRY2xR?=
 =?utf-8?B?Szh6QjM1b2ZYRUMwVkYvaEl6bC8rMGpGVm9uOG12R1FUVmFncS9SeGlxb1Q2?=
 =?utf-8?Q?FHBGIB2wX9rAjhy23oQu778RK+pypf729pOSK3u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d8b444-bf8d-4d7e-cc28-08d8f59137e3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 04:38:53.1483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeSPTg4sHZok3f6kULrRBG98nF9MmHgQp9i+OOW5/gTiaU3LyinQbe3b+3XmYdjHxzyH1jgqSUmg3ZyFlnxBoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1264
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 06 Apr 2021 09:14:00 +0200
Subject: Re: [LTP] [PATCH] bugfix for ssetmask01.c
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



On 4/1/21 2:12 PM, Petr Vorel wrote:
> Hi,
>
>> mips architecture syscall(69) __NR_ssetmask not supported on your arch.
> nit: "mips_o32: Fix __NR_s{g,s}etmask" for bug title would be more descriptive
> than "bugfix for ssetmask01.c". And then in text mention ssetmask01.c.
>
>> +++ b/include/lapi/syscalls/mips_o32.in
>> @@ -66,8 +66,8 @@ getppid 64
>>  getpgrp 65
>>  setsid 66
>>  sigaction 67
>> -sgetmask 68
>> -ssetmask 69
>> +sgetmask 4068
>> +ssetmask 4069
> But more important: I guess you're right because we don't add any offset to the
> numbers. But IMHO all numbers are wrong, all mips files should contain offset
> (01e4dc222 was wrong). mips_o32.in should be offset 4000, mips_n32.in 6000 and
> mips_n64.in 5000 (comparing scall32-o32.S, scall64-64.S, scall64-n32.S in
> arch/mips/kernel in kernel and mips{,n32,64}/bits/syscall.h.in in musl).

Petr is correct. I probably missed interpreting the offsets for each sub-arch.
Sorry for the inconvenience. I'll send a patch to correct this later.

Thanks,
Zhe

>
> Kind regards,
> Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
