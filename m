Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B1221F87
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 11:17:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 980B43C2AA9
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 11:17:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BC3433C0EC0
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 11:15:38 +0200 (CEST)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3CEA6201115
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 11:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; 
 t=1594890937; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to;
 bh=D9UyhNuyCcrcMH3RAcTjipRTXO1Tn3TGftTle+pndLg=;
 b=MLR+d4xVKgeyOFeTKM8KoCoGquYtKwIFeXPCZP7ucEnAiFn20nOKrBGGanim7aJ4uHaTMs
 iXLI+z1SFQaHQvbHcCDkZvx1nrGbjC7p0jV0UoYVCCsyGk3BJQ7xX17sO/zgrzedGWDoKH
 XleezQtZ3oA6WfjIPaN48EhGcUm4OP4=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-T68RvvEAMRC5YoHPfsecyg-1; Thu, 16 Jul 2020 11:15:35 +0200
X-MC-Unique: T68RvvEAMRC5YoHPfsecyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ujw/jtDX9Ct8jgRL5M2imW7nBhlvsLY3kLFtR2hNRQWE+CEEgWvgoboNp0iXnbTcgOtKpCJOIKFSRURWcz32AkukFGQ+hr9h+vMVx/1OspQGmmwTKIpfPkJfR/L+Fx2PYNNFUdn8Qv52XuhvQurG9A0swkKl9KbgFAL5AKXy3MKEbXodd2Ayyej7NhWiuVbIWTDoH768wOpawVPwMxe3glKMgMCuAeTaS8h2HzZ/B+NoB/F2JB2umOPCTghq82La40xCYB7qnYVDSyCw16vTgGuWPkhSlfuexpt2msGjp/f9OF5QdHtvQXdsVlxXJPIzu49ljpylC+Vufu2OBQKuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9UyhNuyCcrcMH3RAcTjipRTXO1Tn3TGftTle+pndLg=;
 b=K5mrDQlxgBYOkFs85aewt/kVYhNo4jITs5NoiZMIGebddbIFVJGYscoy+PhuiG22DBYQPEZ0t2lZwl3WoiFK52ZuJ1ygk3L2tWy5bhj/Hr0FI/JGPh8Ufqvst//BxXY6I6sc2xiAfoo3yarq5US7UpkSJr8gnGkaT7OxI6mjcRHXZTx58yXygsrwmfGbExbI46VvyLGiBuFgttJDsz0WcayUEQcUdvMAtSViZzu8cP4Y30b8bu0IvjCFFTuBh3tdTVS/b3vuG+PY7fEUxlRtTZ76sT7CMoh5OM32U/aZV44NgunDuQzxlPytp3Pb/0ZjjgaR4q8+GSHHmsfL/O2WOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 16 Jul
 2020 09:15:32 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::8da1:583f:c139:bf6e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::8da1:583f:c139:bf6e%7]) with mapi id 15.20.3174.027; Thu, 16 Jul 2020
 09:15:32 +0000
Date: Thu, 16 Jul 2020 11:15:28 +0200
From: Petr Vorel <pvorel@suse.com>
To: liwang@redhat.com
Message-ID: <20200716091528.GA6383@dell5510>
Content-Disposition: inline
In-Reply-To: <20200716061059.30525-2-liwang@redhat.com>
X-ClientProxiedBy: AM0PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::17) To VI1PR04MB5503.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dell5510 (62.201.25.198) by
 AM0PR10CA0100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 09:15:31 +0000
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc500182-971d-44ee-d380-08d82968ca48
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221204980C4590D6842D102FA7F0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/0H3kTUyjGFEsYu1GzlGHgVq8KiC8XVit4U+laRXSADEjLKhci36IRixlzRE3Y4CpJ9VGHvL+Se/1e09HGorw4H3U/9QH/NlHexnbvIkFQqtdcR/a/juTMEOnPlw7oxvyUhfHKqkn9E8Tx40dtsWCRci6ZWbrZJrqzfSE6iwX5G6lqePgfSOyPnfOZANgn+iAZPspNwU64oBUprobyx8Y5ryPFFh6Bc9IhySh3/48drySzGNEMPIYlnNmLsAHJis5UwgFQ3h4WJgpXSvOrC8YbwINz3BVnMTlQxO5t1f7FgIxrXpxXYCEqw54QXm0/dHuTUeiotjafgE+4cJU7mzl072dGp/Pj400uf7T4lWicwfq4PBASW/5Hy4WKkSaJhFtsJ3ZmFPAIp+hEwl3bXWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(376002)(39860400002)(346002)(366004)(186003)(8676002)(9686003)(966005)(8936002)(54906003)(52116002)(316002)(6916009)(3450700001)(6496006)(1076003)(26005)(33656002)(66476007)(66946007)(66556008)(2906002)(16526019)(478600001)(55016002)(4744005)(33716001)(6666004)(5660300002)(956004)(4326008)(9576002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1cHfYSTU0e4KVeD9ba0y+wDHt1XHwAgS4JPtJKX/czgC5jTP5wKj+j2esGTwh+i0IANyvjrtJfzFjdKteXyo2oc6OPt0Vo6e4XYHauYcJTfPxPC8ddhBhlQ9tRSu66Pi/AGYvNBN2Pb2Q3w5vck6J2c5L4BaRDq/WRkRtSOTh1/18SpBgGSWuwsA1RmQVubyRewDj7zba/KH19QLyOd2iAuVbddXieb17hD77Uhq2gIgQiv9J8NhI8ddVVUWQsFFKLELR50VlRFyox76oNQiaQ7wJmqMkK/QpEXbIzsNQMPPrCwB0OoYBy2Fb8s9MdwWjU+9pEBhTG1XAtEvfqmN3IIN1tJNwKJwoO6UramMkYddmZ/WT8buBYA3VLl9yLdGQJG73CGiuXrDdFGnbmEhIhpLoJzYNksRYH4vJkG+g1dKVkE4m9Irr0zlT9a+HyYnux2a+OfYKRXX9q/f1tECx0pIrOxgcaDNG56JQFlgsnw=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc500182-971d-44ee-d380-08d82968ca48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5503.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 09:15:32.3771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zb9vhJZZDddMzvbEtOdKXT93j2WIQNODVposFBn2/sIyjYBO2siD1wMCLj7m+1y6hRtIT9lDIdVdror9m079fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 16 Jul 2020 11:17:19 +0200
Subject: Re: [LTP] [v2,2/2] ioperm: Convert to new API
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
Reply-To: Petr Vorel <pvorel@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

Actually it fails to build on non-intel.
https://travis-ci.org/github/pevik/ltp/jobs/708655670
/usr/src/ltp/testcases/kernel/syscalls/iopl/iopl02.c:21:10: fatal error: sys/io.h: No such file or directory
9793 #include <sys/io.h>

https://travis-ci.org/github/pevik/ltp/builds/708655668

<sys/io.h> needs to be included behind #if defined __i386__ ||
defined(__x86_64__) guarder.

Please fix it before merge.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
