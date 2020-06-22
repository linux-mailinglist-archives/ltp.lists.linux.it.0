Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A38203393
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 11:38:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78A113C2BE5
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 11:38:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0690B3C202D
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 11:22:19 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 64588201100
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 11:22:19 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7dL1S3KlLpsPEBjin8/bfUnF40+pbVqJeeBiZPGEA0JJTs9ZJ8wUBwa/Hp3XjXsPZ+fUt+qAbuCSESBbJ9m0a6r36D17kQBleb8rIepKYExfFIKvAcfUH5AerbyyaPWnmoEoewsiEIz8xVLtaiLwUEbJxTNoP0nzrd5MpzG8QYCHgqHFzC1LlWupS5DNH4fr0YAe0Bqv5ItkKVSbTxtS00vG5vt0HhOp++Zh69iUgUJvU2NL7xpXTYQ/+6Tl5puIKt624bEgLk80vlSDNCIf++5u14sQPM6GqqkfvNqN8R7D9fGVjKUkbsIT40mC7stAkPh4QAxFdZq/VD/Mnek8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3WylBYehtGVIzyZqmUxaL2kM6caDTJIFFkEEKlewDE=;
 b=avc7pHxfARBwSVcL3ZeNoiIqaXBKtivbJqaYVauL0gxgBKIOENurU33N98VhyOThF2dMZiZLfUlGaOsE0As7DmRkdKVEU/cBNkgJ9AGFiNNJqFwzmMFRTzBCw/GtOr+bMJC4wLhFqUSxddWohJWr7EiAEXNSD2YefIV0zXM0qCnbCBTsBcuKAZo/dGftnWdPa0joJdy9aktI+assuR+KUrxyWey2qzrsHQdPBP09TY6J5zm9uMxB7SueEuuYbdx5UXnjsrIkKLrXfl4UXnqSDaNux5t34H9P5ZRmYzPyfPG+OeD6zyoi2mFSWzycdKTyeHd8keMTAy8dX4b/gdFOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3WylBYehtGVIzyZqmUxaL2kM6caDTJIFFkEEKlewDE=;
 b=VCMbFJCsVoXHDho599JQhS7j6eTEMDfJ+ZjpyiAylkjQxCaaiVfrXsyiWNDsVJ5VJHdRv2JU7rfSOYG+iD6bPYKFZCDdTvzg4zj8vL/0II3b4yVmxeOam93ds2w4MPElq9YJzdTcQcvf444IQLDEf8L1MtKmjeagzftRWOqeHeUpm8ojiVN74h9myI0XtisTjemGLgYmUpL5u5J90wDNC5ItXUCHfr0hrxX7is7lFZl2cJ0WnjuiRyhjxavDlqTqJaM4DRSFo1BjGom3YTt0po5FnfO2uTZVQtDryTTBebAZ2hODaasqKcdMig1VDc6g16NerBm99gGcizH23pCXLA==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB4415.eurprd04.prod.outlook.com (2603:10a6:803:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 09:22:16 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 09:22:16 +0000
Date: Mon, 22 Jun 2020 11:22:13 +0200
From: Petr Vorel <pvorel@suse.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200622092213.GA27392@dell5510>
References: <20200622074314.22098-1-petr.vorel@suse.com>
 <CAEemH2cz9s71E+VidezUAfYGarOzgpPTf0VucY+OYCYmjBjTGQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAEemH2cz9s71E+VidezUAfYGarOzgpPTf0VucY+OYCYmjBjTGQ@mail.gmail.com>
X-ClientProxiedBy: AM0PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:208:1::40) To VI1PR04MB5503.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dell5510 (62.201.25.198) by
 AM0PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:208:1::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 09:22:15 +0000
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b75b0ae-8aa9-4419-8bcc-08d8168dc158
X-MS-TrafficTypeDiagnostic: VI1PR04MB4415:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4415CCCE9DE6C47884BB3DBEFA970@VI1PR04MB4415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJDKD1uctc8fZmZ9SxKtb/h3ZnJATp6jehOAuxSx+N+67IA9fRExmE48B5COMkLiRhIKwJ6lESqZZLoAAUzH8+faWKtYXVQdsqCkij/gh3E/Y9dUtldMCchQ5roItnOzwVpZWNUT3hQ4XDk+cgOhIvoY3QUD6Ym3Y1d549cVWJ8LlABCnaOj+19mTL7GCWbYX7ydFjDJQgiV/nsrf0FSFrMN71YcQg1jaQFP+JNDWvTy+Eb3U6z1GyKdMuKmWPfy8iz34Ce7sNY7V8xLWB8XCRcmo5BBot6nxt3vF/CDU9HdH5UpVieztjsmrgCfmQcyMfYZwGkXSHHu4fogYm6sOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(346002)(136003)(366004)(396003)(4744005)(9686003)(5660300002)(8676002)(26005)(8936002)(66946007)(16526019)(66556008)(186003)(66476007)(9576002)(2906002)(6496006)(55016002)(52116002)(4326008)(1076003)(3450700001)(54906003)(33656002)(316002)(956004)(6916009)(33716001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PM0syRtsdZnLodgcSXZ8Sr0cRSkPrusPUvtpEGvQ9zV3SlQk5sgiuG19NLklfQCOzSMqu/fsWs36pxMsto2XUgK+/ZSZzoGWjrkDo1xi/0RF9+9a3ZKSk2ufpFMH5w4G3b1YGciEt4dCi31QrcxPy9nldyE6zWGiBYg/PXp3x2ZX1AoOwTdTmDr7cOj8DkEeDu+JkMhZiFxjHTPkI43UIMAaaYrdpYuXVYyj3M/qqSQ4q5HzxGkgM1WIw5oCMlxDzClyg044RQFchLr38OAuH19Bl+MOu/UT6bev7nQCCYgHHWcPcVeLV377wk00iBjXYngtJq+a7ZFzPTkwOSEF1v1Ao8Mxq0JVZef7CJQr6A7o1bdURUOdHCdof+KDFHJX89dbOmKBZWPvUWleo+OCh9FrkjmUHqCO+3PNRU4R1bisqjm9LZ24QYakACBvtzp5SZkQgvZMpybVHjiWfQy3KoKpWB0IM6tW5vISnnrXrJU=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b75b0ae-8aa9-4419-8bcc-08d8168dc158
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 09:22:16.5169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QWTlG9nFQQ/XKKtHte+iPd9INdQy975ArTBGW+J8fBIX6tuxygrRLQaIUjD1AyXQbu+UHcXvHSkz+tMvCjsxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4415
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 11:38:32 +0200
Subject: Re: [LTP] [PATCH 1/2] cgroup: Fix build with -Werror=return-type
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
Cc: Petr Vorel <petr.vorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> >         tst_brk(TCONF, "Cgroup is not configured");
> > +       return TST_CGROUP_V1; /* fix -Werror=return-type */


> This return looks strange since it will never go to here.

> How about this?

I'm sorry, I overlooked your mail and push whole patchset.

LGTM, feel free to merge.
Tested-by: Petr Vorel <pvorel@suse.cz>

> enum tst_cgroup_ver tst_cgroup_version(void)
> {
>         enum tst_cgroup_ver cg_ver;

>         if (tst_cgroup_check("cgroup2")) {
>                 if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))
>                         cg_ver = TST_CGROUP_V1;
>                 else
>                         cg_ver = TST_CGROUP_V2;

>                 goto out;
>         }

>         if (tst_cgroup_check("cgroup"))
>                 cg_ver = TST_CGROUP_V1;

>         if (!tg_ver)
Typo:
         if (!cg_ver)
>                 tst_brk(TCONF, "Cgroup is not configured");

> out:
>         return cg_ver;
> }

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
