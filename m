Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C521C7DB8A8
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Oct 2023 12:02:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 665C23CEAEB
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Oct 2023 12:02:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 189313C6D29
 for <ltp@lists.linux.it>; Mon, 30 Oct 2023 12:02:20 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3B8191400C47
 for <ltp@lists.linux.it>; Mon, 30 Oct 2023 12:02:18 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYqGZ4ggUXZDdoxLoFweYf79ikBgOB52o2fLaQD9LdX+Nf4trrJakj/vZrWkdJd8aBbH+v2CJQKrQtviAXBIyMk5twApMJy0PWkru/cu+HzyWaTq6dM0Fzez7VQ1/2qvu9grJx37hYqfYRSeM2NetqmuHdreJmzO/VuKkOriTe99eJZydfRr7JrH79mE4YEZDDm9VPjCZa86KijqwrkCC8JXjmJY2vyZJefBSEQVnwq4jI8NRP9wYfj6Se1VkoU9fegaiZoX7tAhobIwYnSv5MDyciCCs1qOiAb6JXokL6ArzpauBiaO1xs29BHZ7aa2zCcdvEcONCqtzFcX+Z8R8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2qpQ7lV12V5tM1st2f4I0ddAnroR6VOCQ6GmxZ5egQ=;
 b=EW7lsIrQuD8skENKY8Fj+nuDV8z0k9+Y6oykWAzvPB7BMZmjNyHc9qK+rF8AKXRPBZgBMx+ATTQN7DxyOIZrsR1l6cnhz7CbU9+pjggodHvCwrUamhMN2QNa66UfDdTqpFVLQ1SyRJ0DMBUY2ZvjXNJBNgb8l3jAl2NdVR+o+Sa3J05jlvFnFqZnhAPs3lRH0yD5jmCTcAM2ORVLypZarUabucpTC8h6cYAPNl8oQWq0MiUQkc7dGijtNfeUUe5syUtngTQlLSxgQTN1u/+suyppadIW5/4WWdB+7e9pkcekQawW5WdnpAWNhWej51cIFHzXXuG8P/uzqwQLaxk5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2qpQ7lV12V5tM1st2f4I0ddAnroR6VOCQ6GmxZ5egQ=;
 b=VHs+dTUn4AmwTHGYTbuljIiyB23eVto0qAQCC4wwQm22Wcv3jkAIKFlYJtSPB5WOtxcu+TdpnZUn3UqGU/2m9yTvIeRW0n618KvVKF3YiEQM+WRD65BPYF4Hgwy2ZMkIiVtuVo8V3/Bj3lGHFbp354uDswjcn/oGQ7a7dIqc68pERQASAOZ5LCiBB+d5v5UeXvodGgb9wmz7bPhob6e/BZlhSf5WHLYR1vwa4B+gQcVipRdW/uRyWfTVX+TmL46XkOlmlNSwi9X1CJ+ctoWn7G8ObFYBZ8NPdXPq0LnOAwwze/zIjXuzaX9NKyPtYGcQhJVCGXYi1HD5LV17HtPD6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB6797.eurprd04.prod.outlook.com (2603:10a6:803:13e::13)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 30 Oct
 2023 11:02:12 +0000
Received: from VI1PR04MB6797.eurprd04.prod.outlook.com
 ([fe80::fe32:e823:6c2a:ec3a]) by VI1PR04MB6797.eurprd04.prod.outlook.com
 ([fe80::fe32:e823:6c2a:ec3a%6]) with mapi id 15.20.6933.011; Mon, 30 Oct 2023
 11:02:12 +0000
Message-ID: <deba82c7-2e7f-4a1f-82f7-8e13a5d7a491@suse.com>
Date: Mon, 30 Oct 2023 12:02:11 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrea Cervesato <andrea.cervesato@suse.de>, ltp@lists.linux.it
References: <20231027140858.28829-1-andrea.cervesato@suse.de>
In-Reply-To: <20231027140858.28829-1-andrea.cervesato@suse.de>
X-ClientProxiedBy: FR4P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::17) To VI1PR04MB6797.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB6797:EE_|PR3PR04MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: d07d5c8e-900a-422b-08a3-08dbd937ab2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UhTPXRSLAsbpETYHSG71m8YMT8Cr1DncMdrtTqx+BEpatGa8HF97soK7QAfD5BfengiSe1uRZwEOAxk26bhoq+g6hKNcG//8ulD5StFD1I/bMPxFwOmer+8HfD6rH+aXDlYYjB+CFS18OrbrB789Db8cWgr9oLq6t/OP9GrPJ+M0F9rzjFZ7hm2bEAaYm2KrMqoVdQ6YvbD+oAZ6hDXAD6Pn69NPnL9Dr7Urj5ut9YRo568mRP3Jr43uA3Ta8SDAfqBs3JI9UfOGB7f+r+AXmkVDeaGfFsDETEA+Svzo7CFoqs60/eXb6SVIgKj2CKBC/O+jzcnWwX0YtXIZr55/0aWAtVv3NFs8ptiEB3j+w0JOMIrAN2Qwik5Z7/ORfnN2B9UYcX1SYB6Lf6XoeG4duXVcNlh97cGiAeEY5TqO5dWPb/seD35wW7ATwCE9Gb6kUWMMy1DW1NtNI8TNbhlqXyU0+6648MBpPTFujcEAHuTsmRIO6GawZ+ZPfgdCrJTLV+HY1DOk33baFn79hkWX3U9TVj+aShSWQdTkOPSNDLJFwk/PGeAkzptqeTJYq+kNkXRHjp5gsmJfCYpcI8AeMH6uvQdHLFzL0V3lBrRPZJmy5xPUA8k31nE2GAs+q9wF/AyLqu2DkCDSMJf3tS5dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB6797.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(44832011)(30864003)(6506007)(2906002)(41300700001)(38100700002)(66476007)(66556008)(2616005)(83380400001)(6512007)(316002)(53546011)(966005)(6486002)(66946007)(86362001)(478600001)(5660300002)(36756003)(31696002)(8676002)(8936002)(26005)(31686004)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFhZdm1KZkQ5UGRQMXIvNGNNcURSYXZmMythQkQ5L3pZU0swY0h2V2JtOG1o?=
 =?utf-8?B?UTY4YU5sKzByeGlRKzBubDhxZndlMllaZHQ5TlkyNFQzOHZKT1BKd1loUGdx?=
 =?utf-8?B?MGRGNFJyUjAyUWpDWkhJazd2SWlmem5kbjU0T3B6WUNpMmczRklHRzJjUFU3?=
 =?utf-8?B?S1dnNW05Y29TdVNqMldEWkh5cHphOGdrbHNuOTlrVDU3T1JyR1ZYT1paZ1pV?=
 =?utf-8?B?bVRIbEhqWVJ6Ri91SnF5c3ZCR3Y0Q3c5L0toUHY1UkU4aEpYTVlianVFanFr?=
 =?utf-8?B?UzhmTlMxejdoUUh6L08zemdLZ0Npd3U2N3RJUHFmcmZ5dE8vUWZXZXl3SjJL?=
 =?utf-8?B?dFFoRDhWYjhITldUbG1jNFNVVlZsNlBXUVlvTk1NbURKdFpFMk8vU211NWNu?=
 =?utf-8?B?YlByOGZmQzdwWXAvVmJhQkNVb3orVGYvdUlaWjNjYXlFbThJN3V2T0NFc29Y?=
 =?utf-8?B?TzRQeTRTc01iWWwxbzluNi9Db3FaWDFHbGpxQ1hMaGZjK1c3NnhHOHJzbndn?=
 =?utf-8?B?TUh3aFJTS2ltSFBXOG5XVzZjZXNSMlFmZjI1NXlTUHd4VkZDTk5ieHdVTkRW?=
 =?utf-8?B?MVI4aE5CbmNkZ0UyRU14eGFodGx3ajVLRjRta1c2SkpQVUJKN0FSSUo5d3NW?=
 =?utf-8?B?ZjhFOU9hbURFWU5WY2RKQ0xzV1VGR3kyNExnakIzWGhBYWdubys0bklleUNy?=
 =?utf-8?B?RlloYVU0eW5PRVpwdDdKVUNCSHVLUnRhVUVGRHVveUFRbTlCZ2dOUnEyS2dO?=
 =?utf-8?B?SklabDR6cDVDOW5zdVBSZ3FKSGxqRGRRRTZnMVY0blZaYXc3dHhZYnhZTG5n?=
 =?utf-8?B?cEd4UTZ5NkpsWHdSWHJkdWNYbzgvWU51QWw4L2pVTXpxTFoyVkc0ZDBORFpq?=
 =?utf-8?B?YlUyNUdYMW1nN2Z6TTNtOVZNSDlKUmxleXl0WExSRTA3NDU3aTlPMk1iM2hS?=
 =?utf-8?B?V1ROSmZJakp3c29lOHl5d1dQMlZwazl2WUkrcW1zYnNoUnBLUWFwajlOV0Ir?=
 =?utf-8?B?dXB1T3FSdXRjMTBPZDUxVXUxVkNtd2g2M1RRU3BCSmN0WmdNbEJEM3VHbzNH?=
 =?utf-8?B?djJnc1VuMzM5bVNyUlY5QWJIT3J6V0lBN3lVWU9wNjh1Q1pILzN6ZnJRVW1M?=
 =?utf-8?B?dUk5SkRyUE9oY3p2aTV1b3k1bVhSZE9WOFM0RjNnVkdzL0xrYmJ1YjZ4QTE5?=
 =?utf-8?B?ZklXeG9jQkxPRXI2S3RkbG9wbms1SFAxTVI3d25DdmZOT201eENma3l5em5S?=
 =?utf-8?B?ZVpqN1BaT2VpSVg5SWtxV1Zpc1V6cjNMZ3FZTTdjU3RtUHlYcjB5b2UvdDZV?=
 =?utf-8?B?dXlXTm5WT0NFdTRPZTB2amFmTm9EZnN1QWxxL0FobnlpaFBiSnNNenp6Nkpj?=
 =?utf-8?B?TTRTWHlzeTdQQm9SR2kyM0xKd1MrU1RTTjdVM3JrR0VrMHplWXBlbDdTMi9l?=
 =?utf-8?B?cDk5UjUzQTNIN0ZHdm1MTlFVWXhidVRMSmFGc3VVQkVaY2FUcDZLdXROMFFy?=
 =?utf-8?B?aDB2TURzeElwK0E0UmFhbHQzZmkxU1RVVW05SDg1Y1RDd284c1ErZkJhVHIz?=
 =?utf-8?B?em9HeDcvVGpwU3RsVEMwQkJubUw4eXZFelM2dlhQRkoyTDVsVDZMMEkvSU44?=
 =?utf-8?B?TFMwZmVlTVc5bmprc2lUWDRpSzFva2xZVURlaTQxU3R0ZGhTemxMU2NkRzRE?=
 =?utf-8?B?ZmRvcG1IYTZYS09LVEl0NkFzZ09hQjZuWDZlNDFCa2lWNmVLNU85NGNVWEFi?=
 =?utf-8?B?RXhEelN3dGZtWXBNeFlPZFZPVkxZU0RLMUozcmJCSjF1MGFnUzVUL01yei9S?=
 =?utf-8?B?QnNEdXVBd0Q1TjhFQ1Y4dUU2aFRRMXJ6cFRHcmg5QW91Y2xJN3N2TnQrSlRH?=
 =?utf-8?B?bTRFZk9UdWowZWE1SHJVSHdReUtnb0I2TDdycms0UEs2bEVSZ0hKVzlLcGRB?=
 =?utf-8?B?c0VNYis1VnN1aXV4MVAwb0ZtbE9WakpKWHFJU2lqbi8wSjZsSFlJZ2w5Nkd0?=
 =?utf-8?B?SHdsZStjTlpJTnQ5YlUvMElweThXS2tLRE9GVFNaa3lZblJvUTIwUFNETm4z?=
 =?utf-8?B?OWwxdVpBY1pnUUZOMWw4cjN1WldIYlRGR1JBN0EwZUN3SkFhMDEyS1VRQU95?=
 =?utf-8?B?ZENISHpQcHkyaW96ZWhYSEh5dDh0c0pONm5waFI5M1pMNUZybEUrbjczRUpQ?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07d5c8e-900a-422b-08a3-08dbd937ab2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 11:02:12.3790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuI8p0zRNOvMFvKF6vPkjEFz963FnqDFVvuUAAooS5ugT30JHF8mSfYlo4Hi1LQqjoRgkt63jYUByOwqvBcc+A3hrnlll1ru8bXLzbEvQ9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Rewrite fsx-linux test
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

Please consider v2 during the review process.

Regards,
Andrea Cervesato

On 10/27/23 16:08, Andrea Cervesato wrote:
> From: Andrea Cervesato <andrea.cervesato@suse.com>
>
> This is a complete rewrite of the old test. Some options have been
> removed, since they were not used by LTP runtests. Also, the new
> test is not skipping any operation and running a new one if the
> previous failed, until the total amount of operations have been
> executed. The test passes once all operations succeded.
>
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>   runtest/ltp-aiodio.part3                  |   99 +-
>   testcases/kernel/fs/fsx-linux/Makefile    |    4 +-
>   testcases/kernel/fs/fsx-linux/fsx-linux.c | 1509 ++++-----------------
>   testcases/network/nfs/fsx-linux/fsx.sh    |    3 +-
>   4 files changed, 324 insertions(+), 1291 deletions(-)
>
> diff --git a/runtest/ltp-aiodio.part3 b/runtest/ltp-aiodio.part3
> index d53e836b9..e4adafec0 100644
> --- a/runtest/ltp-aiodio.part3
> +++ b/runtest/ltp-aiodio.part3
> @@ -1,51 +1,48 @@
> -#           fname:  this filename is Required (no default)
> -#
> -#
> -FSX032 fsx-linux -l 500000 -r 4096 -t 4096 -w 4096 -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX033 fsx-linux -l 500000 -r 4096 -t 2048 -w 2048 -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX034 fsx-linux -l 500000 -r 4096 -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX035 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX036 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX037 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX038 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX039 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
> -FSX040 fsx-linux -N 10000 -o 1024 $TMPDIR/aiodio.$$/junkfile
> -FSX041 fsx-linux -N 10000 -o 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX042 fsx-linux -N 10000 -o 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX043 fsx-linux -N 10000 -o 8192 $TMPDIR/aiodio.$$/junkfile
> -FSX044 fsx-linux -N 10000 -o 16384 $TMPDIR/aiodio.$$/junkfile
> -FSX045 fsx-linux -N 10000 -o 32768 $TMPDIR/aiodio.$$/junkfile
> -FSX046 fsx-linux -N 10000 -o 128000 $TMPDIR/aiodio.$$/junkfile
> -FSX047 fsx-linux -N 10000 -o 1024 $TMPDIR/aiodio.$$/junkfile
> -FSX048 fsx-linux -N 10000 -o 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX049 fsx-linux -N 10000 -o 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX050 fsx-linux -N 10000 -o 8192 $TMPDIR/aiodio.$$/junkfile
> -FSX051 fsx-linux -N 10000 -o 16384 $TMPDIR/aiodio.$$/junkfile
> -FSX052 fsx-linux -N 10000 -o 32768 $TMPDIR/aiodio.$$/junkfile
> -FSX053 fsx-linux -N 10000 -o 128000 $TMPDIR/aiodio.$$/junkfile
> -FSX054 fsx-linux -N 10000  -o 1024 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX055 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX056 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX057 fsx-linux -N 10000  -o 8192 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX058 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX059 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX060 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX061 fsx-linux -N 10000 -o 32768 $TMPDIR/aiodio.$$/junkfile
> -FSX062 fsx-linux -N 10000 -o 128000 $TMPDIR/aiodio.$$/junkfile
> -FSX063 fsx-linux -N 10000  -o 1024  -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX064 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX065 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX066 fsx-linux -N 10000  -o 8192  -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX067 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX068 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
> -FSX069 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX070 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
> -FSX071 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096   $TMPDIR/aiodio.$$/junkfile1
> -FSX072 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048   $TMPDIR/aiodio.$$/junkfile2
> -FSX073 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile3
> -FSX074 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096   $TMPDIR/aiodio.$$/junkfile4
> -FSX075 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048   $TMPDIR/aiodio.$$/junkfile5
> -FSX076 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile6
> -FSX077 fsx-linux -N 10000   $TMPDIR/aiodio.$$/junkfile7
> -FSX078 fsx-linux -N 100000  $TMPDIR/aiodio.$$/junkfile8
> -FSX079 fsx-linux -N 100000  $TMPDIR/aiodio.$$/junkfile9
> +FSX032 fsx-linux -l 500000 -r 4096 -t 4096 -w 4096 -N 10000
> +FSX033 fsx-linux -l 500000 -r 4096 -t 2048 -w 2048 -N 10000
> +FSX034 fsx-linux -l 500000 -r 4096 -N 10000
> +FSX035 fsx-linux -N 10000
> +FSX036 fsx-linux -N 10000
> +FSX037 fsx-linux -N 10000
> +FSX038 fsx-linux -N 10000
> +FSX039 fsx-linux -N 10000
> +FSX040 fsx-linux -N 10000 -o 1024
> +FSX041 fsx-linux -N 10000 -o 2048
> +FSX042 fsx-linux -N 10000 -o 4096
> +FSX043 fsx-linux -N 10000 -o 8192
> +FSX044 fsx-linux -N 10000 -o 16384
> +FSX045 fsx-linux -N 10000 -o 32768
> +FSX046 fsx-linux -N 10000 -o 128000
> +FSX047 fsx-linux -N 10000 -o 1024
> +FSX048 fsx-linux -N 10000 -o 2048
> +FSX049 fsx-linux -N 10000 -o 4096
> +FSX050 fsx-linux -N 10000 -o 8192
> +FSX051 fsx-linux -N 10000 -o 16384
> +FSX052 fsx-linux -N 10000 -o 32768
> +FSX053 fsx-linux -N 10000 -o 128000
> +FSX054 fsx-linux -N 10000  -o 1024 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX055 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048
> +FSX056 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX057 fsx-linux -N 10000  -o 8192 -l 500000 -r 4096 -t 2048 -w 2048
> +FSX058 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX059 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048
> +FSX060 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX061 fsx-linux -N 10000 -o 32768
> +FSX062 fsx-linux -N 10000 -o 128000
> +FSX063 fsx-linux -N 10000  -o 1024  -l 500000 -r 4096 -t 4096 -w 4096
> +FSX064 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048
> +FSX065 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX066 fsx-linux -N 10000  -o 8192  -l 500000 -r 4096 -t 2048 -w 2048
> +FSX067 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX068 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048
> +FSX069 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX070 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096
> +FSX071 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096  1
> +FSX072 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048  2
> +FSX073 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 40963
> +FSX074 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096  4
> +FSX075 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048  5
> +FSX076 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 40966
> +FSX077 fsx-linux -N 10000  7
> +FSX078 fsx-linux -N 100000 8
> +FSX079 fsx-linux -N 100000 9
> diff --git a/testcases/kernel/fs/fsx-linux/Makefile b/testcases/kernel/fs/fsx-linux/Makefile
> index 956486b8a..5d04d81bc 100644
> --- a/testcases/kernel/fs/fsx-linux/Makefile
> +++ b/testcases/kernel/fs/fsx-linux/Makefile
> @@ -22,13 +22,11 @@
>   
>   top_srcdir			?= ../../../..
>   
> -include $(top_srcdir)/include/mk/env_pre.mk
> +include $(top_srcdir)/include/mk/testcases.mk
>   
>   CPPFLAGS			+= -DNO_XFS -I$(abs_srcdir) \
>   				   -D_LARGEFILE64_SOURCE -D_GNU_SOURCE
>   
>   WCFLAGS				+= -w
>   
> -INSTALL_TARGETS			:= fsxtest*
> -
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/fs/fsx-linux/fsx-linux.c b/testcases/kernel/fs/fsx-linux/fsx-linux.c
> index 64c27a0f5..112c21f85 100644
> --- a/testcases/kernel/fs/fsx-linux/fsx-linux.c
> +++ b/testcases/kernel/fs/fsx-linux/fsx-linux.c
> @@ -1,1353 +1,392 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
>    * Copyright (C) 1991, NeXT Computer, Inc.  All Rights Reserverd.
> - * Copyright (c) 1998-2001 Apple Computer, Inc. All rights reserved.
> - *
> - * @APPLE_LICENSE_HEADER_START@
> - *
> - * The contents of this file constitute Original Code as defined in and
> - * are subject to the Apple Public Source License Version 1.1 (the
> - * "License").  You may not use this file except in compliance with the
> - * License.  Please obtain a copy of the License at
> - * http://www.apple.com/publicsource and read it before using this file.
> - *
> - * This Original Code and all software distributed under the License are
> - * distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, EITHER
> - * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
> - * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT.  Please see the
> - * License for the specific language governing rights and limitations
> - * under the License.
> - *
> - * @APPLE_LICENSE_HEADER_END@
> - *
> - *	File:	fsx.c
>    *	Author:	Avadis Tevanian, Jr.
>    *
> - *	File system exerciser.
> - *
> - *	Rewrite and enhancements 1998-2001 Conrad Minshall -- conrad@mac.com
> - *
> - *	Various features from Joe Sokol, Pat Dirks, and Clark Warner.
> - *
> - *	Small changes to work under Linux -- davej@suse.de
> - *
> - *	Sundry porting patches from Guy Harris 12/2001
> - * $FreeBSD: src/tools/regression/fsx/fsx.c,v 1.1 2001/12/20 04:15:57 jkh Exp $
> + * Copyright (c) 1998-2001 Apple Computer, Inc. All rights reserved.
> + *	Conrad Minshall <conrad@mac.com>
> + *	Dave Jones <davej@suse.de>
> + *	Zach Brown <zab@clusterfs.com>
> + *	Joe Sokol, Pat Dirks, Clark Warner, Guy Harris
>    *
> - *	Add multi-file testing feature -- Zach Brown <zab@clusterfs.com>
> + * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
>    */
>   
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#if defined(_UWIN) || defined(__linux__)
> -#include <sys/param.h>
> -#include <limits.h>
> -#include <time.h>
> -#include <string.h>
> -#include <sys/time.h>
> -#endif
> -#include <fcntl.h>
> -#include <sys/mman.h>
> -#ifndef MAP_FILE
> -#define MAP_FILE 0
> -#endif
> -#include <limits.h>
> -#include <signal.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <unistd.h>
> -#include <stdarg.h>
> -#include <errno.h>
> -
> -/*
> - *	A log entry is an operation and a bunch of arguments.
> +/*\
> + * [Description]
> + *
> + * This is a complete rewrite of the old fsx-linux tool, created by
> + * NeXT Computer, Inc. and Apple Computer, Inc. between 1991 and 2001,
> + * then adapted for LTP. Test is actually a file system exerciser: we bring a
> + * file and randomly write operations like read/write/map read/map write and
> + * truncate, according with input parameters. Then we check if all of them
> + * have been completed.
>    */
>   
> -struct log_entry {
> -	int operation;
> -	struct timeval tv;
> -	int args[3];
> +#include <stdlib.h>
> +#include "tst_test.h"
> +
> +#define FNAME "ltp-file.bin"
> +
> +enum {
> +	OP_READ = 0,
> +	OP_WRITE,
> +	OP_TRUNCATE,
> +	OP_MAPREAD,
> +	OP_MAPWRITE,
> +	/* keep counter here */
> +	OP_TOTAL,
>   };
>   
> -#define	LOGSIZE	1000
> +static char *str_file_max_size;
> +static char *str_op_max_size;
> +static char *str_op_nums;
> +static char *str_op_write_align;
> +static char *str_op_read_align;
> +static char *str_op_trunc_align;
> +
> +static int file_desc;
> +static long long file_max_size = 256 * 1024;
> +static long long op_max_size = 64 * 1024;
> +static long long file_size;
> +static int op_write_align = 1;
> +static int op_read_align = 1;
> +static int op_trunc_align = 1;
> +static int op_nums = 1000;
> +static int page_size;
> +
> +static char *file_buff;
> +static char *temp_buff;
> +
> +struct file_pos_t {
> +	long long offset;
> +	long long size;
> +};
>   
> -struct log_entry oplog[LOGSIZE];	/* the log */
> -int logptr = 0;			/* current position in log */
> -int logcount = 0;		/* total ops */
> +static void op_align_pages(struct file_pos_t *pos)
> +{
> +	long long pg_offset;
>   
> -/*
> - *	Define operations
> - */
> +	pg_offset = pos->offset % page_size;
>   
> -#define	OP_READ		1
> -#define OP_WRITE	2
> -#define OP_TRUNCATE	3
> -#define OP_CLOSEOPEN	4
> -#define OP_MAPREAD	5
> -#define OP_MAPWRITE	6
> -#define OP_SKIPPED	7
> -
> -int page_size;
> -int page_mask;
> -
> -char *original_buf;		/* a pointer to the original data */
> -char *good_buf;			/* a pointer to the correct data */
> -char *temp_buf;			/* a pointer to the current data */
> -char *fname;			/* name of our test file */
> -char logfile[1024];		/* name of our log file */
> -char goodfile[1024];		/* name of our test file */
> -
> -off_t file_size = 0;
> -off_t biggest = 0;
> -char state[256];
> -unsigned long testcalls = 0;	/* calls to function "test" */
> -
> -unsigned long simulatedopcount = 0;	/* -b flag */
> -int closeprob = 0;		/* -c flag */
> -int debug = 0;			/* -d flag */
> -unsigned long debugstart = 0;	/* -D flag */
> -unsigned long maxfilelen = 256 * 1024;	/* -l flag */
> -int sizechecks = 1;		/* -n flag disables them */
> -int maxoplen = 64 * 1024;	/* -o flag */
> -int quiet = 0;			/* -q flag */
> -unsigned long progressinterval = 0;	/* -p flag */
> -int readbdy = 1;		/* -r flag */
> -int style = 0;			/* -s flag */
> -int truncbdy = 1;		/* -t flag */
> -int writebdy = 1;		/* -w flag */
> -long monitorstart = -1;		/* -m flag */
> -long monitorend = -1;		/* -m flag */
> -int lite = 0;			/* -L flag */
> -long numops = -1;		/* -N flag */
> -int randomoplen = 1;		/* -O flag disables it */
> -int seed = 1;			/* -S flag */
> -int mapped_writes = 1;		/* -W flag disables */
> -int mapped_reads = 1;		/* -R flag disables it */
> -int fsxgoodfd = 0;
> -FILE *fsxlogf = NULL;
> -int badoff = -1;
> -
> -void vwarnc(int code,const char *fmt, va_list ap)
> -{
> -	fprintf(stderr, "fsx: ");
> -	if (fmt != NULL) {
> -		vfprintf(stderr, fmt, ap);
> -		fprintf(stderr, ": ");
> -	}
> -	fprintf(stderr, "%s\n", strerror(code));
> +	pos->offset -= pg_offset;
> +	pos->size += pg_offset;
>   }
>   
> -void warn(const char *fmt, ...)
> +static void op_file_position(
> +	const long long fsize,
> +	const int align,
> +	struct file_pos_t *pos)
>   {
> -	va_list ap;
> -	va_start(ap, fmt);
> -	vwarnc(errno, fmt, ap);
> -	va_end(ap);
> -}
> +	long long diff;
>   
> -void
> -    __attribute__ ((format(printf, 1, 2)))
> -    prt(char *fmt, ...)
> -{
> -	va_list args;
> +	pos->offset = random() % fsize;
> +	pos->size = random() % (fsize - pos->offset);
>   
> -	va_start(args, fmt);
> -	vfprintf(stdout, fmt, args);
> -	va_end(args);
> +	diff = pos->offset % align;
>   
> -	if (fsxlogf) {
> -		va_start(args, fmt);
> -		vfprintf(fsxlogf, fmt, args);
> -		va_end(args);
> +	if (diff) {
> +		pos->offset -= diff;
> +		pos->size += diff;
>   	}
> -}
> -
> -void prterr(char *prefix)
> -{
> -	prt("%s%s%s\n", prefix, prefix ? ": " : "", strerror(errno));
> -}
>   
> -void log4(int operation, int arg0, int arg1, int arg2, struct timeval *tv)
> -{
> -	struct log_entry *le;
> -
> -	le = &oplog[logptr];
> -	le->tv = *tv;
> -	le->operation = operation;
> -	le->args[0] = arg0;
> -	le->args[1] = arg1;
> -	le->args[2] = arg2;
> -	logptr++;
> -	logcount++;
> -	if (logptr >= LOGSIZE)
> -		logptr = 0;
> +	if (!pos->size)
> +		pos->size = 1;
>   }
>   
> -void logdump(void)
> +static void update_file_size(struct file_pos_t const *pos)
>   {
> -	int i, count, down;
> -	struct log_entry *lp;
> -
> -	prt("LOG DUMP (%d total operations):\n", logcount);
> -	if (logcount < LOGSIZE) {
> -		i = 0;
> -		count = logcount;
> -	} else {
> -		i = logptr;
> -		count = LOGSIZE;
> -	}
> -	for (; count > 0; count--) {
> -		int opnum;
> +	if (pos->offset + pos->size > file_size) {
> +		file_size = pos->offset + pos->size;
>   
> -		opnum = i + 1 + (logcount / LOGSIZE) * LOGSIZE;
> -		lp = &oplog[i];
> -		prt("%d: %lu.%06lu ", opnum, lp->tv.tv_sec, lp->tv.tv_usec);
> -
> -		switch (lp->operation) {
> -		case OP_MAPREAD:
> -			prt("MAPREAD  0x%x thru 0x%x (0x%x bytes)",
> -			    lp->args[0], lp->args[0] + lp->args[1] - 1,
> -			    lp->args[1]);
> -			if (badoff >= lp->args[0] && badoff <
> -			    lp->args[0] + lp->args[1])
> -				prt("\t***RRRR***");
> -			break;
> -		case OP_MAPWRITE:
> -			prt("MAPWRITE 0x%x thru 0x%x (0x%x bytes)",
> -			    lp->args[0], lp->args[0] + lp->args[1] - 1,
> -			    lp->args[1]);
> -			if (badoff >= lp->args[0] && badoff <
> -			    lp->args[0] + lp->args[1])
> -				prt("\t******WWWW");
> -			break;
> -		case OP_READ:
> -			prt("READ     0x%x thru 0x%x (0x%x bytes)",
> -			    lp->args[0], lp->args[0] + lp->args[1] - 1,
> -			    lp->args[1]);
> -			if (badoff >= lp->args[0] &&
> -			    badoff < lp->args[0] + lp->args[1])
> -				prt("\t***RRRR***");
> -			break;
> -		case OP_WRITE:
> -			prt("WRITE    0x%x thru 0x%x (0x%x bytes)",
> -			    lp->args[0], lp->args[0] + lp->args[1] - 1,
> -			    lp->args[1]);
> -			if (lp->args[0] > lp->args[2])
> -				prt(" HOLE");
> -			else if (lp->args[0] + lp->args[1] > lp->args[2])
> -				prt(" EXTEND");
> -			if ((badoff >= lp->args[0] || badoff >= lp->args[2]) &&
> -			    badoff < lp->args[0] + lp->args[1])
> -				prt("\t***WWWW");
> -			break;
> -		case OP_TRUNCATE:
> -			down = lp->args[0] < lp->args[1];
> -			prt("TRUNCATE %s\tfrom 0x%x to 0x%x",
> -			    down ? "DOWN" : "UP", lp->args[1], lp->args[0]);
> -			if (badoff >= lp->args[!down] &&
> -			    badoff < lp->args[! !down])
> -				prt("\t******WWWW");
> -			break;
> -		case OP_CLOSEOPEN:
> -			prt("CLOSE/OPEN");
> -			break;
> -		case OP_SKIPPED:
> -			prt("SKIPPED (no operation)");
> -			break;
> -		default:
> -			prt("BOGUS LOG ENTRY (operation code = %d)!",
> -			    lp->operation);
> -		}
> -		prt("\n");
> -		i++;
> -		if (i == LOGSIZE)
> -			i = 0;
> +		tst_res(TINFO, "File size changed: %llu", file_size);
>   	}
>   }
>   
> -void save_buffer(char *buffer, off_t bufferlength, int fd)
> +static int memory_compare(
> +	const char *a,
> +	const char *b,
> +	const long long offset,
> +	const long long size)
>   {
> -	off_t ret;
> -	ssize_t byteswritten;
> -
> -	if (fd <= 0 || bufferlength == 0)
> -		return;
> +	int diff;
>   
> -	if (bufferlength > INT_MAX) {
> -		prt("fsx flaw: overflow in save_buffer\n");
> -		exit(67);
> -	}
> -	if (lite) {
> -		off_t size_by_seek = lseek(fd, (off_t) 0, SEEK_END);
> -		if (size_by_seek == (off_t) - 1)
> -			prterr("save_buffer: lseek eof");
> -		else if (bufferlength > size_by_seek) {
> -			warn("save_buffer: .fsxgood file too short... will "
> -			     "save 0x%llx bytes instead of 0x%llx\n",
> -			     (unsigned long long)size_by_seek,
> -			     (unsigned long long)bufferlength);
> -			bufferlength = size_by_seek;
> +	for (long long i = 0; i < size; i++) {
> +		diff = a[i] - b[i];
> +		if (diff) {
> +			tst_res(TINFO,
> +				"File memory differs at offset=%llu ('%c' != '%c')",
> +				offset + i, a[i], b[i]);
> +			break;
>   		}
>   	}
>   
> -	ret = lseek(fd, (off_t) 0, SEEK_SET);
> -	if (ret == (off_t) - 1)
> -		prterr("save_buffer: lseek 0");
> -
> -	byteswritten = write(fd, buffer, (size_t) bufferlength);
> -	if (byteswritten != bufferlength) {
> -		if (byteswritten == -1)
> -			prterr("save_buffer write");
> -		else
> -			warn("save_buffer: short write, 0x%x bytes instead "
> -			     "of 0x%llx\n",
> -			     (unsigned)byteswritten,
> -			     (unsigned long long)bufferlength);
> -	}
> +	return diff;
>   }
>   
> -void report_failure(int status)
> +static int op_read(void)
>   {
> -	logdump();
> -
> -	if (fsxgoodfd) {
> -		if (good_buf) {
> -			save_buffer(good_buf, file_size, fsxgoodfd);
> -			prt("Correct content saved for comparison\n");
> -			prt("(maybe hexdump \"%s\" vs \"%s\")\n",
> -			    fname, goodfile);
> -		}
> -		close(fsxgoodfd);
> +	if (!file_size) {
> +		tst_res(TINFO, "Skipping zero size read");
> +		return 0;
>   	}
> -	exit(status);
> -}
>   
> -#define short_at(cp) ((unsigned short)((*((unsigned char *)(cp)) << 8) | \
> -				        *(((unsigned char *)(cp)) + 1)))
> +	struct file_pos_t pos;
>   
> -void check_buffers(unsigned offset, unsigned size)
> -{
> -	unsigned char c, t;
> -	unsigned i = 0;
> -	unsigned n = 0;
> -	unsigned op = 0;
> -	unsigned bad = 0;
> -
> -	if (memcmp(good_buf + offset, temp_buf, size) != 0) {
> -		prt("READ BAD DATA: offset = 0x%x, size = 0x%x\n",
> -		    offset, size);
> -		prt("OFFSET\tGOOD\tBAD\tRANGE\n");
> -		while (size > 0) {
> -			c = good_buf[offset];
> -			t = temp_buf[i];
> -			if (c != t) {
> -				if (n == 0) {
> -					bad = short_at(&temp_buf[i]);
> -					prt("%#07x\t%#06x\t%#06x", offset,
> -					    short_at(&good_buf[offset]), bad);
> -					op = temp_buf[offset & 1 ? i + 1 : i];
> -				}
> -				n++;
> -				badoff = offset;
> -			}
> -			offset++;
> -			i++;
> -			size--;
> -		}
> -		if (n) {
> -			prt("\t%#7x\n", n);
> -			if (bad)
> -				prt("operation# (mod 256) for the bad data "
> -				    "may be %u\n", ((unsigned)op & 0xff));
> -			else
> -				prt("operation# (mod 256) for the bad data "
> -				    "unknown, check HOLE and EXTEND ops\n");
> -		} else
> -			prt("????????????????\n");
> -		report_failure(110);
> -	}
> -}
> +	op_file_position(file_size, op_read_align, &pos);
>   
> -struct test_file {
> -	char *path;
> -	int fd;
> -} *test_files = NULL;
> +	tst_res(TINFO,
> +		"Reading at offset=%llu, size=%llu",
> +		pos.offset,
> +		pos.size);
>   
> -int num_test_files = 0;
> -enum fd_iteration_policy {
> -	FD_SINGLE,
> -	FD_ROTATE,
> -	FD_RANDOM,
> -};
> -int fd_policy = FD_RANDOM;
> -int fd_last = 0;
> +	memset(temp_buff, 0, file_max_size);
>   
> -struct test_file *get_tf(void)
> -{
> -	unsigned index = 0;
> -
> -	switch (fd_policy) {
> -	case FD_ROTATE:
> -		index = fd_last++;
> -		break;
> -	case FD_RANDOM:
> -		index = random();
> -		break;
> -	case FD_SINGLE:
> -		index = 0;
> -		break;
> -	default:
> -		prt("unknown policy");
> -		exit(1);
> -		break;
> -	}
> -	return &test_files[index % num_test_files];
> -}
> +	SAFE_LSEEK(file_desc, (off_t)pos.offset, SEEK_SET);
> +	SAFE_READ(0, file_desc, temp_buff, pos.size);
>   
> -void assign_fd_policy(char *policy)
> -{
> -	if (!strcmp(policy, "random"))
> -		fd_policy = FD_RANDOM;
> -	else if (!strcmp(policy, "rotate"))
> -		fd_policy = FD_ROTATE;
> -	else {
> -		prt("unknown -I policy: '%s'\n", policy);
> -		exit(1);
> -	}
> -}
> +	int ret = memory_compare(
> +		file_buff + pos.offset,
> +		temp_buff,
> +		pos.offset,
> +		pos.size);
>   
> -int get_fd(void)
> -{
> -	struct test_file *tf = get_tf();
> -	return tf->fd;
> +	if (ret)
> +		return -1;
> +
> +	return 1;
>   }
>   
> -void open_test_files(char **argv, int argc)
> +static int op_write(void)
>   {
> -	struct test_file *tf;
> -	int i;
> +	if (file_size >= file_max_size) {
> +		tst_res(TINFO, "Skipping max size write");
> +		return 0;
> +	}
>   
> -	num_test_files = argc;
> -	if (num_test_files == 1)
> -		fd_policy = FD_SINGLE;
> +	struct file_pos_t pos;
> +	char data;
>   
> -	test_files = calloc(num_test_files, sizeof(*test_files));
> -	if (test_files == NULL) {
> -		prterr("reallocating space for test files");
> -		exit(1);
> -	}
> +	op_file_position(file_max_size, op_write_align, &pos);
>   
> -	for (i = 0, tf = test_files; i < num_test_files; i++, tf++) {
> +	for (long long i = 0; i < pos.size; i++) {
> +		data = random() % 10 + 'a';
>   
> -		tf->path = argv[i];
> -		tf->fd = open(tf->path, O_RDWR | (lite ? 0 : O_CREAT | O_TRUNC),
> -			      0666);
> -		if (tf->fd < 0) {
> -			prterr(tf->path);
> -			exit(91);
> -		}
> +		file_buff[pos.offset + i] = data;
> +		temp_buff[i] = data;
>   	}
>   
> -	if (quiet || fd_policy == FD_SINGLE)
> -		return;
> +	tst_res(TINFO,
> +		"Writing at offset=%llu, size=%llu",
> +		pos.offset,
> +		pos.size);
>   
> -	for (i = 0, tf = test_files; i < num_test_files; i++, tf++)
> -		prt("fd %d: %s\n", i, tf->path);
> -}
> +	SAFE_LSEEK(file_desc, (off_t)pos.offset, SEEK_SET);
> +	SAFE_WRITE(SAFE_WRITE_ALL, file_desc, temp_buff, pos.size);
>   
> -void close_test_files(void)
> -{
> -	int i;
> -	struct test_file *tf;
> +	update_file_size(&pos);
>   
> -	for (i = 0, tf = test_files; i < num_test_files; i++, tf++) {
> -		if (close(tf->fd)) {
> -			prterr("close");
> -			report_failure(99);
> -		}
> -	}
> +	return 1;
>   }
>   
> -void check_size(void)
> +static int op_truncate(void)
>   {
> -	struct stat statbuf;
> -	off_t size_by_seek;
> -	int fd = get_fd();
> +	struct file_pos_t pos;
>   
> -	if (fstat(fd, &statbuf)) {
> -		prterr("check_size: fstat");
> -		statbuf.st_size = -1;
> -	}
> -	size_by_seek = lseek(fd, (off_t) 0, SEEK_END);
> -	if (file_size != statbuf.st_size || file_size != size_by_seek) {
> -		prt("Size error: expected 0x%llx stat 0x%llx seek 0x%llx\n",
> -		    (unsigned long long)file_size,
> -		    (unsigned long long)statbuf.st_size,
> -		    (unsigned long long)size_by_seek);
> -		report_failure(120);
> -	}
> -}
> +	op_file_position(file_max_size, op_trunc_align, &pos);
>   
> -void check_trunc_hack(void)
> -{
> -	struct stat statbuf;
> -	int fd = get_fd();
> -
> -	ftruncate(fd, (off_t) 0);
> -	ftruncate(fd, (off_t) 100000);
> -	if (fstat(fd, &statbuf)) {
> -		prterr("trunc_hack: fstat");
> -		statbuf.st_size = -1;
> -	}
> -	if (statbuf.st_size != (off_t) 100000) {
> -		prt("no extend on truncate! not posix!\n");
> -		exit(130);
> -	}
> -	ftruncate(fd, 0);
> -}
> +	file_size = pos.offset + pos.size;
>   
> -static char *tf_buf = NULL;
> -static int max_tf_len = 0;
> +	tst_res(TINFO, "Truncating to %llu", file_size);
>   
> -void alloc_tf_buf(void)
> -{
> -	char dummy = '\0';
> -	int highest = num_test_files - 1;
> -	int len;
> -
> -	len = snprintf(&dummy, 0, "%u ", highest);
> -	if (len < 1) {
> -		prterr("finding max tf_buf");
> -		exit(1);
> -	}
> -	len++;
> -	tf_buf = malloc(len);
> -	if (tf_buf == NULL) {
> -		prterr("allocating tf_buf");
> -		exit(1);
> -	}
> -	max_tf_len = snprintf(tf_buf, len, "%u ", highest);
> -	if (max_tf_len < 1) {
> -		prterr("fiding max_tv_len\n");
> -		exit(1);
> -	}
> -	if (max_tf_len != len - 1) {
> -		warn("snprintf() gave %d instead of %d?\n",
> -		     max_tf_len, len - 1);
> -		exit(1);
> -	}
> -}
> +	SAFE_FTRUNCATE(file_desc, file_size);
> +	memset(file_buff + file_size, 0, file_max_size - file_size);
>   
> -char *fill_tf_buf(struct test_file *tf)
> -{
> -	if (tf_buf == NULL)
> -		alloc_tf_buf();
> -
> -	sprintf(tf_buf, "%lu ", (unsigned long)(tf - test_files));
> -	return tf_buf;
> -}
> -
> -void
> -output_line(struct test_file *tf, int op, unsigned offset,
> -	    unsigned size, struct timeval *tv)
> -{
> -	char *tf_num = "";
> -
> -	char *ops[] = {
> -		[OP_READ] = "read",
> -		[OP_WRITE] = "write",
> -		[OP_TRUNCATE] = "trunc from",
> -		[OP_MAPREAD] = "mapread",
> -		[OP_MAPWRITE] = "mapwrite",
> -	};
> -
> -	/* W. */
> -	if (!(!quiet && ((progressinterval &&
> -			  testcalls % progressinterval == 0) ||
> -			 (debug &&
> -			  (monitorstart == -1 ||
> -			   (offset + size > monitorstart &&
> -			    (monitorend == -1 || offset <= monitorend)))))))
> -		return;
> -
> -	if (fd_policy != FD_SINGLE)
> -		tf_num = fill_tf_buf(tf);
> -
> -	prt("%06lu %lu.%06lu %.*s%-10s %#08x %s %#08x\t(0x%x bytes)\n",
> -	    testcalls, tv->tv_sec, tv->tv_usec, max_tf_len,
> -	    tf_num, ops[op],
> -	    offset, op == OP_TRUNCATE ? " to " : "thru",
> -	    offset + size - 1, size);
> +	return 1;
>   }
>   
> -void doread(unsigned offset, unsigned size)
> +static int op_map_read(void)
>   {
> -	struct timeval t;
> -	off_t ret;
> -	unsigned iret;
> -	struct test_file *tf = get_tf();
> -	int fd = tf->fd;
> -
> -	offset -= offset % readbdy;
> -	gettimeofday(&t, NULL);
> -	if (size == 0) {
> -		if (!quiet && testcalls > simulatedopcount)
> -			prt("skipping zero size read\n");
> -		log4(OP_SKIPPED, OP_READ, offset, size, &t);
> -		return;
> -	}
> -	if (size + offset > file_size) {
> -		if (!quiet && testcalls > simulatedopcount)
> -			prt("skipping seek/read past end of file\n");
> -		log4(OP_SKIPPED, OP_READ, offset, size, &t);
> -		return;
> +	if (!file_size) {
> +		tst_res(TINFO, "Skipping zero size read");
> +		return 0;
>   	}
>   
> -	log4(OP_READ, offset, size, 0, &t);
> +	struct file_pos_t pos;
> +	char *addr;
>   
> -	if (testcalls <= simulatedopcount)
> -		return;
> +	op_file_position(file_size, op_read_align, &pos);
> +	op_align_pages(&pos);
>   
> -	output_line(tf, OP_READ, offset, size, &t);
> +	tst_res(TINFO,
> +		"Map reading at offset=%llu, size=%llu",
> +		pos.offset,
> +		pos.size);
>   
> -	ret = lseek(fd, (off_t) offset, SEEK_SET);
> -	if (ret == (off_t) - 1) {
> -		prterr("doread: lseek");
> -		report_failure(140);
> -	}
> -	iret = read(fd, temp_buf, size);
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu read done\n", t.tv_sec, t.tv_usec);
> -	}
> -	if (iret != size) {
> -		if (iret == -1)
> -			prterr("doread: read");
> -		else
> -			prt("short read: 0x%x bytes instead of 0x%x\n",
> -			    iret, size);
> -		report_failure(141);
> -	}
> -	check_buffers(offset, size);
> -}
> -
> -void domapread(unsigned offset, unsigned size)
> -{
> -	struct timeval t;
> -	unsigned pg_offset;
> -	unsigned map_size;
> -	char *p;
> -	struct test_file *tf = get_tf();
> -	int fd = tf->fd;
> -
> -	offset -= offset % readbdy;
> -	gettimeofday(&t, NULL);
> -	if (size == 0) {
> -		if (!quiet && testcalls > simulatedopcount)
> -			prt("skipping zero size read\n");
> -		log4(OP_SKIPPED, OP_MAPREAD, offset, size, &t);
> -		return;
> -	}
> -	if (size + offset > file_size) {
> -		if (!quiet && testcalls > simulatedopcount)
> -			prt("skipping seek/read past end of file\n");
> -		log4(OP_SKIPPED, OP_MAPREAD, offset, size, &t);
> -		return;
> -	}
> -
> -	log4(OP_MAPREAD, offset, size, 0, &t);
> +	addr = SAFE_MMAP(
> +		0, pos.size,
> +		PROT_READ,
> +		MAP_FILE | MAP_SHARED,
> +		file_desc,
> +		(off_t)pos.offset);
>   
> -	if (testcalls <= simulatedopcount)
> -		return;
> +	memcpy(file_buff + pos.offset, addr, pos.size);
>   
> -	output_line(tf, OP_MAPREAD, offset, size, &t);
> +	int ret = memory_compare(
> +		addr,
> +		file_buff + pos.offset,
> +		pos.offset,
> +		pos.size);
>   
> -	pg_offset = offset & page_mask;
> -	map_size = pg_offset + size;
> +	SAFE_MUNMAP(addr, pos.size);
> +	if (ret)
> +		return -1;
>   
> -	if ((p = mmap(0, map_size, PROT_READ, MAP_FILE | MAP_SHARED, fd,
> -		      (off_t) (offset - pg_offset))) == MAP_FAILED) {
> -		prterr("domapread: mmap");
> -		report_failure(190);
> -	}
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu mmap done\n", t.tv_sec, t.tv_usec);
> -	}
> -	memcpy(temp_buf, p + pg_offset, size);
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu memcpy done\n", t.tv_sec, t.tv_usec);
> -	}
> -	if (munmap(p, map_size) != 0) {
> -		prterr("domapread: munmap");
> -		report_failure(191);
> -	}
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu munmap done\n", t.tv_sec, t.tv_usec);
> -	}
> -
> -	check_buffers(offset, size);
> +	return 1;
>   }
>   
> -void gendata(char *original_buf, char *good_buf, unsigned offset, unsigned size)
> +static int op_map_write(void)
>   {
> -	while (size--) {
> -		good_buf[offset] = testcalls % 256;
> -		if (offset % 2)
> -			good_buf[offset] += original_buf[offset];
> -		offset++;
> +	if (file_size >= file_max_size) {
> +		tst_res(TINFO, "Skipping max size write");
> +		return 0;
>   	}
> -}
>   
> -void dowrite(unsigned offset, unsigned size)
> -{
> -	struct timeval t;
> -	off_t ret;
> -	unsigned iret;
> -	struct test_file *tf = get_tf();
> -	int fd = tf->fd;
> -
> -	offset -= offset % writebdy;
> -	gettimeofday(&t, NULL);
> -	if (size == 0) {
> -		if (!quiet && testcalls > simulatedopcount)
> -			prt("skipping zero size write\n");
> -		log4(OP_SKIPPED, OP_WRITE, offset, size, &t);
> -		return;
> -	}
> +	struct file_pos_t pos;
> +	char *addr;
>   
> -	log4(OP_WRITE, offset, size, file_size, &t);
> +	op_file_position(file_max_size, op_write_align, &pos);
> +	op_align_pages(&pos);
>   
> -	gendata(original_buf, good_buf, offset, size);
> -	if (file_size < offset + size) {
> -		if (file_size < offset)
> -			memset(good_buf + file_size, '\0', offset - file_size);
> -		file_size = offset + size;
> -		if (lite) {
> -			warn("Lite file size bug in fsx!");
> -			report_failure(149);
> -		}
> -	}
> +	if (file_size < pos.offset + pos.size)
> +		SAFE_FTRUNCATE(file_desc, pos.offset + pos.size);
>   
> -	if (testcalls <= simulatedopcount)
> -		return;
> +	tst_res(TINFO,
> +		"Map writing at offset=%llu, size=%llu",
> +		pos.offset,
> +		pos.size);
>   
> -	output_line(tf, OP_WRITE, offset, size, &t);
> +	for (long long i = 0; i < pos.size; i++)
> +		file_buff[pos.offset + i] = random() % 10 + 'l';
>   
> -	ret = lseek(fd, (off_t) offset, SEEK_SET);
> -	if (ret == (off_t) - 1) {
> -		prterr("dowrite: lseek");
> -		report_failure(150);
> -	}
> -	iret = write(fd, good_buf + offset, size);
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu write done\n", t.tv_sec, t.tv_usec);
> -	}
> -	if (iret != size) {
> -		if (iret == -1)
> -			prterr("dowrite: write");
> -		else
> -			prt("short write: 0x%x bytes instead of 0x%x\n",
> -			    iret, size);
> -		report_failure(151);
> -	}
> -}
> +	addr = SAFE_MMAP(
> +		0, pos.size,
> +		PROT_READ | PROT_WRITE,
> +		MAP_FILE | MAP_SHARED,
> +		file_desc,
> +		(off_t)pos.offset);
>   
> -void domapwrite(unsigned offset, unsigned size)
> -{
> -	struct timeval t;
> -	unsigned pg_offset;
> -	unsigned map_size;
> -	off_t cur_filesize;
> -	char *p;
> -	struct test_file *tf = get_tf();
> -	int fd = tf->fd;
> -
> -	offset -= offset % writebdy;
> -	gettimeofday(&t, NULL);
> -	if (size == 0) {
> -		if (!quiet && testcalls > simulatedopcount)
> -			prt("skipping zero size write\n");
> -		log4(OP_SKIPPED, OP_MAPWRITE, offset, size, &t);
> -		return;
> -	}
> -	cur_filesize = file_size;
> -
> -	log4(OP_MAPWRITE, offset, size, 0, &t);
> -
> -	gendata(original_buf, good_buf, offset, size);
> -	if (file_size < offset + size) {
> -		if (file_size < offset)
> -			memset(good_buf + file_size, '\0', offset - file_size);
> -		file_size = offset + size;
> -		if (lite) {
> -			warn("Lite file size bug in fsx!");
> -			report_failure(200);
> -		}
> -	}
> +	memcpy(addr, file_buff + pos.offset, pos.size);
> +	msync(addr, pos.size, MS_SYNC);
>   
> -	if (testcalls <= simulatedopcount)
> -		return;
> +	SAFE_MUNMAP(addr, pos.size);
>   
> -	output_line(tf, OP_MAPWRITE, offset, size, &t);
> +	update_file_size(&pos);
>   
> -	if (file_size > cur_filesize) {
> -		if (ftruncate(fd, file_size) == -1) {
> -			prterr("domapwrite: ftruncate");
> -			exit(201);
> -		}
> -		if (!quiet && (debug > 1 &&
> -			       (monitorstart == -1 ||
> -				(offset + size > monitorstart &&
> -				 (monitorend == -1
> -				  || offset <= monitorend))))) {
> -			gettimeofday(&t, NULL);
> -			prt("       %lu.%06lu truncate done\n", t.tv_sec,
> -			    t.tv_usec);
> -		}
> -	}
> -	pg_offset = offset & page_mask;
> -	map_size = pg_offset + size;
> -
> -	if ((p =
> -	     mmap(0, map_size, PROT_READ | PROT_WRITE, MAP_FILE | MAP_SHARED,
> -		  fd, (off_t) (offset - pg_offset))) == MAP_FAILED) {
> -		prterr("domapwrite: mmap");
> -		report_failure(202);
> -	}
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu mmap done\n", t.tv_sec, t.tv_usec);
> -	}
> -	memcpy(p + pg_offset, good_buf + offset, size);
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu memcpy done\n", t.tv_sec, t.tv_usec);
> -	}
> -	if (msync(p, map_size, 0) != 0) {
> -		prterr("domapwrite: msync");
> -		report_failure(203);
> -	}
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu msync done\n", t.tv_sec, t.tv_usec);
> -	}
> -	if (munmap(p, map_size) != 0) {
> -		prterr("domapwrite: munmap");
> -		report_failure(204);
> -	}
> -	if (!quiet && (debug > 1 &&
> -		       (monitorstart == -1 ||
> -			(offset + size > monitorstart &&
> -			 (monitorend == -1 || offset <= monitorend))))) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu munmap done\n", t.tv_sec, t.tv_usec);
> -	}
> +	return 1;
>   }
>   
> -void dotruncate(unsigned size)
> +static void run(void)
>   {
> -	struct timeval t;
> -	int oldsize = file_size;
> -	struct test_file *tf = get_tf();
> -	int fd = tf->fd;
> -
> -	size -= size % truncbdy;
> -	gettimeofday(&t, NULL);
> -	if (size > biggest) {
> -		biggest = size;
> -		if (!quiet && testcalls > simulatedopcount)
> -			prt("truncating to largest ever: 0x%x\n", size);
> -	}
> +	int op;
> +	int ret;
> +	int counter = 0;
>   
> -	log4(OP_TRUNCATE, size, (unsigned)file_size, 0, &t);
> +	file_size = 0;
>   
> -	if (size > file_size)
> -		memset(good_buf + file_size, '\0', size - file_size);
> -	file_size = size;
> +	memset(file_buff, 0, file_max_size);
> +	memset(temp_buff, 0, file_max_size);
>   
> -	if (testcalls <= simulatedopcount)
> -		return;
> +	SAFE_FTRUNCATE(file_desc, 0);
>   
> -	output_line(tf, OP_TRUNCATE, oldsize, size, &t);
> +	while (counter < op_nums) {
> +		op = random() % OP_TOTAL;
>   
> -	if (ftruncate(fd, (off_t) size) == -1) {
> -		prt("ftruncate1: %x\n", size);
> -		prterr("dotruncate: ftruncate");
> -		report_failure(160);
> -	}
> -	if (!quiet && debug > 1) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu trunc done\n", t.tv_sec, t.tv_usec);
> -	}
> -}
> +		switch (op) {
> +		case OP_WRITE:
> +			ret = op_write();
> +			break;
> +		case OP_MAPREAD:
> +			ret = op_map_read();
> +			break;
> +		case OP_MAPWRITE:
> +			ret = op_map_write();
> +			break;
> +		case OP_TRUNCATE:
> +			ret = op_truncate();
> +			break;
> +		case OP_READ:
> +		default:
> +			ret = op_read();
> +			break;
> +		};
>   
> -void writefileimage(void)
> -{
> -	ssize_t iret;
> -	int fd = get_fd();
> +		if (ret == -1)
> +			break;
>   
> -	if (lseek(fd, (off_t) 0, SEEK_SET) == (off_t) - 1) {
> -		prterr("writefileimage: lseek");
> -		report_failure(171);
> +		counter += ret;
>   	}
> -	iret = write(fd, good_buf, file_size);
> -	if ((off_t) iret != file_size) {
> -		if (iret == -1)
> -			prterr("writefileimage: write");
> -		else
> -			prt("short write: 0x%lx bytes instead of 0x%llx\n",
> -			    (unsigned long)iret, (unsigned long long)file_size);
> -		report_failure(172);
> -	}
> -	if (lite ? 0 : ftruncate(fd, file_size) == -1) {
> -		prt("ftruncate2: %llx\n", (unsigned long long)file_size);
> -		prterr("writefileimage: ftruncate");
> -		report_failure(173);
> -	}
> -}
>   
> -void docloseopen(void)
> -{
> -	struct timeval t;
> -	struct test_file *tf = get_tf();
> -
> -	if (testcalls <= simulatedopcount)
> -		return;
> -
> -	gettimeofday(&t, NULL);
> -	log4(OP_CLOSEOPEN, file_size, (unsigned)file_size, 0, &t);
> -
> -	if (debug)
> -		prt("%06lu %lu.%06lu close/open\n", testcalls, t.tv_sec,
> -		    t.tv_usec);
> -	if (close(tf->fd)) {
> -		prterr("docloseopen: close");
> -		report_failure(180);
> -	}
> -	if (!quiet && debug > 1) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu close done\n", t.tv_sec, t.tv_usec);
> -	}
> -	tf->fd = open(tf->path, O_RDWR, 0);
> -	if (tf->fd < 0) {
> -		prterr("docloseopen: open");
> -		report_failure(181);
> -	}
> -	if (!quiet && debug > 1) {
> -		gettimeofday(&t, NULL);
> -		prt("       %lu.%06lu open done\n", t.tv_sec, t.tv_usec);
> -	}
> +	if (counter != op_nums)
> +		tst_brk(TFAIL, "Some file operations failed");
> +	else
> +		tst_res(TPASS, "All file operations succeed");
>   }
>   
> -void test(void)
> +static void setup(void)
>   {
> -	unsigned long offset;
> -	unsigned long size = maxoplen;
> -	unsigned long rv = random();
> -	unsigned long op = rv % (3 + !lite + mapped_writes);
> -
> -	/* turn off the map read if necessary */
> -
> -	if (op == 2 && !mapped_reads)
> -		op = 0;
> -
> -	if (simulatedopcount > 0 && testcalls == simulatedopcount)
> -		writefileimage();
> -
> -	testcalls++;
> -
> -	if (debugstart > 0 && testcalls >= debugstart)
> -		debug = 1;
> -
> -	if (!quiet && testcalls < simulatedopcount && testcalls % 100000 == 0)
> -		prt("%lu...\n", testcalls);
> -
> -	/*
> -	 * READ:        op = 0
> -	 * WRITE:       op = 1
> -	 * MAPREAD:     op = 2
> -	 * TRUNCATE:    op = 3
> -	 * MAPWRITE:    op = 3 or 4
> -	 */
> -	if (lite ? 0 : op == 3 && (style & 1) == 0)	/* vanilla truncate? */
> -		dotruncate(random() % maxfilelen);
> -	else {
> -		if (randomoplen)
> -			size = random() % (maxoplen + 1);
> -		if (lite ? 0 : op == 3)
> -			dotruncate(size);
> -		else {
> -			offset = random();
> -			if (op == 1 || op == (lite ? 3 : 4)) {
> -				offset %= maxfilelen;
> -				if (offset + size > maxfilelen)
> -					size = maxfilelen - offset;
> -				if (op != 1)
> -					domapwrite(offset, size);
> -				else
> -					dowrite(offset, size);
> -			} else {
> -				if (file_size)
> -					offset %= file_size;
> -				else
> -					offset = 0;
> -				if (offset + size > file_size)
> -					size = file_size - offset;
> -				if (op != 0)
> -					domapread(offset, size);
> -				else
> -					doread(offset, size);
> -			}
> -		}
> -	}
> -	if (sizechecks && testcalls > simulatedopcount)
> -		check_size();
> -	if (closeprob && (rv >> 3) < (1 << 28) / closeprob)
> -		docloseopen();
> -}
> +	if (tst_parse_filesize(str_file_max_size, &file_max_size, 1, LLONG_MAX))
> +		tst_brk(TBROK, "Invalid file size '%s'", str_file_max_size);
>   
> -void cleanup(int sig)
> -{
> -	if (sig)
> -		prt("signal %d\n", sig);
> -	prt("testcalls = %lu\n", testcalls);
> -	exit(sig);
> -}
> +	if (tst_parse_filesize(str_op_max_size, &op_max_size, 1, LLONG_MAX))
> +		tst_brk(TBROK, "Invalid maximum size for single operation '%s'", str_op_max_size);
>   
> -void usage(void)
> -{
> -	fprintf(stdout, "usage: %s",
> -		"fsx [-dnqLOW] [-b opnum] [-c Prob] [-l flen] [-m "
> -		"start:end] [-o oplen] [-p progressinterval] [-r readbdy] [-s style] [-t "
> -		"truncbdy] [-w writebdy] [-D startingop] [-N numops] [-P dirpath] [-S seed] "
> -		"[ -I random|rotate ] fname [additional paths to fname..]\n"
> -		"	-b opnum: beginning operation number (default 1)\n"
> -		"	-c P: 1 in P chance of file close+open at each op (default infinity)\n"
> -		"	-d: debug output for all operations [-d -d = more debugging]\n"
> -		"	-l flen: the upper bound on file size (default 262144)\n"
> -		"	-m start:end: monitor (print debug) specified byte range (default 0:infinity)\n"
> -		"	-n: no verifications of file size\n"
> -		"	-o oplen: the upper bound on operation size (default 65536)\n"
> -		"	-p progressinterval: debug output at specified operation interval\n"
> -		"	-q: quieter operation\n"
> -		"	-r readbdy: 4096 would make reads page aligned (default 1)\n"
> -		"	-s style: 1 gives smaller truncates (default 0)\n"
> -		"	-t truncbdy: 4096 would make truncates page aligned (default 1)\n"
> -		"	-w writebdy: 4096 would make writes page aligned (default 1)\n"
> -		"	-D startingop: debug output starting at specified operation\n"
> -		"	-L: fsxLite - no file creations & no file size changes\n"
> -		"	-N numops: total # operations to do (default infinity)\n"
> -		"	-O: use oplen (see -o flag) for every op (default random)\n"
> -		"	-P: save .fsxlog and .fsxgood files in dirpath (default ./)\n"
> -		"	-S seed: for random # generator (default 1) 0 gets timestamp\n"
> -		"	-W: mapped write operations DISabled\n"
> -		"	-R: read() system calls only (mapped reads disabled)\n"
> -		"	-I: When multiple paths to the file are given each operation uses\n"
> -		"	    a different path.  Iterate through them in order with 'rotate'\n"
> -		"	    or chose then at 'random'.  (defaults to random)\n"
> -		"	fname: this filename is REQUIRED (no default)\n");
> -	exit(90);
> -}
> +	if (tst_parse_int(str_op_nums, &op_nums, 1, INT_MAX))
> +		tst_brk(TBROK, "Invalid number of operations '%s'", str_op_nums);
>   
> -int getnum(char *s, char **e)
> -{
> -	int ret = -1;
> -
> -	*e = NULL;
> -	ret = strtol(s, e, 0);
> -	if (*e)
> -		switch (**e) {
> -		case 'b':
> -		case 'B':
> -			ret *= 512;
> -			*e = *e + 1;
> -			break;
> -		case 'k':
> -		case 'K':
> -			ret *= 1024;
> -			*e = *e + 1;
> -			break;
> -		case 'm':
> -		case 'M':
> -			ret *= 1024 * 1024;
> -			*e = *e + 1;
> -			break;
> -		case 'w':
> -		case 'W':
> -			ret *= 4;
> -			*e = *e + 1;
> -			break;
> -		}
> -	return (ret);
> -}
> +	if (tst_parse_int(str_op_write_align, &op_write_align, 1, INT_MAX))
> +		tst_brk(TBROK, "Invalid memory write alignment factor '%s'", str_op_write_align);
>   
> -int main(int argc, char **argv)
> -{
> -	int i, style, ch;
> -	char *endp;
> -	int dirpath = 0;
> -
> -	goodfile[0] = 0;
> -	logfile[0] = 0;
> -
> -	page_size = getpagesize();
> -	page_mask = page_size - 1;
> -
> -	setvbuf(stdout, NULL, _IOLBF, 0);	/* line buffered stdout */
> -
> -	while ((ch = getopt(argc, argv,
> -			    "b:c:dl:m:no:p:qr:s:t:w:D:I:LN:OP:RS:W"))
> -	       != EOF)
> -		switch (ch) {
> -		case 'b':
> -			simulatedopcount = getnum(optarg, &endp);
> -			if (!quiet)
> -				fprintf(stdout, "Will begin at operation"
> -					"%ld\n", simulatedopcount);
> -			if (simulatedopcount == 0)
> -				usage();
> -			simulatedopcount -= 1;
> -			break;
> -		case 'c':
> -			closeprob = getnum(optarg, &endp);
> -			if (!quiet)
> -				fprintf(stdout,
> -					"Chance of close/open is 1 in %d\n",
> -					closeprob);
> -			if (closeprob <= 0)
> -				usage();
> -			break;
> -		case 'd':
> -			debug++;
> -			break;
> -		case 'l':
> -			maxfilelen = getnum(optarg, &endp);
> -			if (maxfilelen <= 0)
> -				usage();
> -			break;
> -		case 'm':
> -			monitorstart = getnum(optarg, &endp);
> -			if (monitorstart < 0)
> -				usage();
> -			if (!endp || *endp++ != ':')
> -				usage();
> -			monitorend = getnum(endp, &endp);
> -			if (monitorend < 0)
> -				usage();
> -			if (monitorend == 0)
> -				monitorend = -1;	/* aka infinity */
> -			debug = 1;
> -		case 'n':
> -			sizechecks = 0;
> -			break;
> -		case 'o':
> -			maxoplen = getnum(optarg, &endp);
> -			if (maxoplen <= 0)
> -				usage();
> -			break;
> -		case 'p':
> -			progressinterval = getnum(optarg, &endp);
> -			if (progressinterval < 0)
> -				usage();
> -			break;
> -		case 'q':
> -			quiet = 1;
> -			break;
> -		case 'r':
> -			readbdy = getnum(optarg, &endp);
> -			if (readbdy <= 0)
> -				usage();
> -			break;
> -		case 's':
> -			style = getnum(optarg, &endp);
> -			if (style < 0 || style > 1)
> -				usage();
> -			break;
> -		case 't':
> -			truncbdy = getnum(optarg, &endp);
> -			if (truncbdy <= 0)
> -				usage();
> -			break;
> -		case 'w':
> -			writebdy = getnum(optarg, &endp);
> -			if (writebdy <= 0)
> -				usage();
> -			break;
> -		case 'D':
> -			debugstart = getnum(optarg, &endp);
> -			if (debugstart < 1)
> -				usage();
> -			break;
> -		case 'I':
> -			assign_fd_policy(optarg);
> -			break;
> -		case 'L':
> -			lite = 1;
> -			break;
> -		case 'N':
> -			numops = getnum(optarg, &endp);
> -			if (numops < 0)
> -				usage();
> -			break;
> -		case 'O':
> -			randomoplen = 0;
> -			break;
> -		case 'P':
> -			strncpy(goodfile, optarg, sizeof(goodfile));
> -			strcat(goodfile, "/");
> -			strncpy(logfile, optarg, sizeof(logfile));
> -			strcat(logfile, "/");
> -			dirpath = 1;
> -			break;
> -		case 'R':
> -			mapped_reads = 0;
> -			break;
> -		case 'S':
> -			seed = getnum(optarg, &endp);
> -			if (seed == 0)
> -				seed = time(0) % 10000;
> -			if (!quiet)
> -				fprintf(stdout, "Seed set to %d\n", seed);
> -			if (seed < 0)
> -				usage();
> -			break;
> -		case 'W':
> -			mapped_writes = 0;
> -			if (!quiet)
> -				fprintf(stdout, "mapped writes DISABLED\n");
> -			break;
> +	if (tst_parse_int(str_op_read_align, &op_read_align, 1, INT_MAX))
> +		tst_brk(TBROK, "Invalid memory read alignment factor '%s'", str_op_read_align);
>   
> -		default:
> -			usage();
> +	if (tst_parse_int(str_op_trunc_align, &op_trunc_align, 1, INT_MAX))
> +		tst_brk(TBROK, "Invalid memory truncate alignment factor '%s'", str_op_trunc_align);
>   
> -		}
> -	argc -= optind;
> -	argv += optind;
> -	if (argc < 1)
> -		usage();
> -	fname = argv[0];
> -
> -	signal(SIGHUP, cleanup);
> -	signal(SIGINT, cleanup);
> -	signal(SIGPIPE, cleanup);
> -	signal(SIGALRM, cleanup);
> -	signal(SIGTERM, cleanup);
> -	signal(SIGXCPU, cleanup);
> -	signal(SIGXFSZ, cleanup);
> -	signal(SIGVTALRM, cleanup);
> -	signal(SIGUSR1, cleanup);
> -	signal(SIGUSR2, cleanup);
> -
> -	initstate(seed, state, 256);
> -	setstate(state);
> -
> -	open_test_files(argv, argc);
> -
> -	strncat(goodfile, dirpath ? basename(fname) : fname, 256);
> -	strcat(goodfile, ".fsxgood");
> -	fsxgoodfd = open(goodfile, O_RDWR | O_CREAT | O_TRUNC, 0666);
> -	if (fsxgoodfd < 0) {
> -		prterr(goodfile);
> -		exit(92);
> -	}
> -	strncat(logfile, dirpath ? basename(fname) : fname, 256);
> -	strcat(logfile, ".fsxlog");
> -	fsxlogf = fopen(logfile, "w");
> -	if (fsxlogf == NULL) {
> -		prterr(logfile);
> -		exit(93);
> -	}
> -	if (lite) {
> -		off_t ret;
> -		int fd = get_fd();
> -		file_size = maxfilelen = lseek(fd, (off_t) 0, SEEK_END);
> -		if (file_size == (off_t) - 1) {
> -			prterr(fname);
> -			warn("main: lseek eof");
> -			exit(94);
> -		}
> -		ret = lseek(fd, (off_t) 0, SEEK_SET);
> -		if (ret == (off_t) - 1) {
> -			prterr(fname);
> -			warn("main: lseek 0");
> -			exit(95);
> -		}
> -	}
> -	original_buf = malloc(maxfilelen);
> -	if (original_buf == NULL)
> -		exit(96);
> -	for (i = 0; i < maxfilelen; i++)
> -		original_buf[i] = random() % 256;
> -
> -	good_buf = malloc(maxfilelen);
> -	if (good_buf == NULL)
> -		exit(97);
> -	memset(good_buf, '\0', maxfilelen);
> -
> -	temp_buf = malloc(maxoplen);
> -	if (temp_buf == NULL)
> -		exit(99);
> -	memset(temp_buf, '\0', maxoplen);
> -
> -	if (lite) {		/* zero entire existing file */
> -		ssize_t written;
> -		int fd = get_fd();
> -
> -		written = write(fd, good_buf, (size_t) maxfilelen);
> -		if (written != maxfilelen) {
> -			if (written == -1) {
> -				prterr(fname);
> -				warn("main: error on write");
> -			} else
> -				warn("main: short write, 0x%x bytes instead "
> -				     "of 0x%x\n",
> -				     (unsigned)written, maxfilelen);
> -			exit(98);
> -		}
> -	} else
> -		check_trunc_hack();
> +	page_size = (int)sysconf(_SC_PAGESIZE);
> +
> +	srandom(time(NULL));
>   
> -	while (numops == -1 || numops--)
> -		test();
> +	file_desc = SAFE_OPEN(FNAME, O_RDWR | O_CREAT, 0666);
>   
> -	close_test_files();
> -	prt("All operations completed A-OK!\n");
> +	file_buff = SAFE_MALLOC(file_max_size);
> +	temp_buff = SAFE_MALLOC(file_max_size);
> +}
>   
> -	if (tf_buf)
> -		free(tf_buf);
> +static void cleanup(void)
> +{
> +	if (file_buff)
> +		free(file_buff);
>   
> -	free(original_buf);
> -	free(good_buf);
> -	free(temp_buf);
> +	if (temp_buff)
> +		free(temp_buff);
>   
> -	return 0;
> +	if (file_desc)
> +		SAFE_CLOSE(file_desc);
>   }
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run,
> +	.options = (struct tst_option[]) {
> +		{ "l:", &str_file_max_size, "Maximum size in MB of the test file(s) (default 262144)" },
> +		{ "o:", &str_op_max_size, "Maximum size for single operation (default 65536)" },
> +		{ "N:", &str_op_nums, "Total # operations to do (default 1000)" },
> +		{ "w:", &str_op_write_align, "Write memory page alignment (default 1)" },
> +		{ "r:", &str_op_read_align, "Read memory page alignment (default 1)" },
> +		{ "t:", &str_op_trunc_align, "Truncate memory page alignment (default 1)" },
> +		{},
> +	},
> +};
> diff --git a/testcases/network/nfs/fsx-linux/fsx.sh b/testcases/network/nfs/fsx-linux/fsx.sh
> index 9bb46ad6e..dbecbfaf9 100755
> --- a/testcases/network/nfs/fsx-linux/fsx.sh
> +++ b/testcases/network/nfs/fsx-linux/fsx.sh
> @@ -14,10 +14,9 @@ do_test()
>   {
>   	ITERATIONS=${ITERATIONS:=50000}
>   	tst_res TINFO "starting fsx-linux -N $ITERATIONS..."
> -	fsx-linux -N $ITERATIONS testfile > fsx-out.log 2>&1
> +	fsx-linux -N $ITERATIONS
>   	if [ "$?" -ne 0 ]; then
>   		tst_res TFAIL "Errors have resulted from this test"
> -		cat fsx-out.log
>   	else
>   		tst_res TPASS "fsx-linux test passed"
>   	fi



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
