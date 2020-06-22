Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9820305D
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:11:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 665BA3C2C16
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:11:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AE74D3C2B12
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:46 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4310C14017F5
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:45 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQixzIqQE9f++hflXZi+H7p9pJ6FY4QkGXUgi4koOUXisJaQyk5pUe5sLnb5SvxKbrVQCFsAqzFHSQ5ZQjnyshSMFujnUamdQKY2w6FaQH/h+jOk1FZyCvRqbispx2Tejd8mUw33mXmAet45mRKkaga76KkScAIDhKL+6ePXJE+NDBs5C2tb9ddfAL9FmAIca2szKFbVPG8XHfhATJFKYlOAPbXKuO+a44DITdThEMkQq0SSTrpYKFs+LxRWTBVbqaJdnBUWuKnnqP7a33RLJS6NU2Ugw0hLziI4LkDjxEMevXJkSiQyyeLVRAe1StMgCwZVuwlyn4KNBx6QxVAa6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay8lmp6onm9/DS3smJOjtHenON8IQrFMVoqyUgTcgyQ=;
 b=GdQO0+P/0K8qqg5de1E+42NcFcS2MDbVpuyKPZmhGL5Rcx1z0YZRWnnlcVW9c3Z+4p4g788/0GiEzTK5jEu9mfdm70FFoa3fAx46swDOdJyUoMnHIG7bN78sEFcadu+dxkFaZn5syPDYMn7gZffpFjqtJTEw1l62rbLX8it2vKSw22bBkpcTwGY7WvuSyWrk3fHiEuOwPnR795gCwNizo/hzd6DbHmO+XSDgyB9ccJHGag+3q6zutC/+LYiT1m4Irng0hsNL2XK7bQfInT1rdI3WRR5PcFwDTZs77i5jcix48qPWLmMF8OgkMB2YEIqmkJ5ra22O9m5awVMnl8IzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay8lmp6onm9/DS3smJOjtHenON8IQrFMVoqyUgTcgyQ=;
 b=TgmFkAYu7y5SjMagcfKCP82H//U6BgjXR4wQ8iOVukoUW9j0KzYEGNS8XIS6g+Cf0Q0g4/ZBJarI8vMMBwFlkcrx3LTiPAQVKJpKOw9otJMTDFJkpn+PFmvAgDKTZOxhvmkJOF9BuEwNowfvzRqzJ5H+MSFzGPaPJXfP2ny22gHgUKz/oVlwxuCNkN2QRDTcS8ECdrwNRDi/Zfa6c0pJxHlqJwMOzdxvLL+NkrkPM7TumPjaOdcTHNMeXedJp08kNCDqFEpda32X+QESWFjLx4JHe27fTOGRcm2bv+uyQ8dEPd/PZzg/4P7mB8t07PdTQ/+tVaFGCmxB8k2KSsQ5DQ==
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB5726.eurprd04.prod.outlook.com (2603:10a6:803:e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:09:43 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 07:09:43 +0000
From: Petr Vorel <petr.vorel@suse.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 09:09:06 +0200
Message-Id: <20200622070911.16123-1-petr.vorel@suse.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: AM0PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::29) To VI1PR04MB5503.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dell5510.arch.suse.de (62.201.25.198) by
 AM0PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:208:ac::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.10 via Frontend Transport; Mon, 22 Jun 2020 07:09:42 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f91bd316-fc00-4564-a796-08d8167b3ce4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5726:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5726261AA1ABF0EFAE47F43DFA970@VI1PR04MB5726.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+wUL9ZB0eJTg1f5pFJ5BXgJ3aNTL9lptEIcNXvjnIBFDYFMIl7bb5uj35biHypFBufXGsnO6sBGqw+/hP13BfQHYTC96iuAUKNNUjpFGP8FbAUZMSbfWsnJ9/DopSFEektC9ljENc6Jm11ovVxZHyXE6rSL2QiAtlKV+28lrhxOWhTAZAlR5JKkD2qXw2yPi+Qbb2CK1UiJu5W2HZHA/K4x05Ey0Il56q7dv4SQxRsw6C4StO8/K4Fe1kph8Pm/z9UOcgm3bX43R46r3Z3bUb9r4Nhqbwk17SMNyOY+JJuihYaP8aBMhRmxneB0t84Qcb8fBn6LPGy+LLVUNbySGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(376002)(39850400004)(136003)(396003)(6486002)(52116002)(956004)(36756003)(8676002)(2616005)(6512007)(44832011)(86362001)(6506007)(26005)(186003)(316002)(54906003)(4326008)(16526019)(4744005)(1076003)(8936002)(478600001)(5660300002)(15650500001)(6916009)(66476007)(66946007)(83380400001)(2906002)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aR+jCPMXB8vXVVEBa6w/Pr0tD7qpdJR26yyImuPYNnJH/6ByQWpZaJ0hc9NXuLWl8ObaWDlPA2dNUHSqZfWn0bbNNAcKEJTTPX8vjlDVfP+hpCSNPW5MDJpFf4c0EYon9Y3wFGmIuCDTpPBRd1atPE0KxmwuzE5dGjoDQQ52K3oneFMytpokgD+2UuIkA76LU48NPOCJOH3WK93wxn7uWKvfs+TPmCaTaPvD99AsKyRtjjgS6yWUC5JIDtGyxR7e2m3EHcT8OsgH1h6/V8vWtBspoQk8qRhhevPMr80Tl7ou2VoDiN/hPwwjLzwcvpHcqzTQ3ckoTyuCPAgSqDpFMK1HSgkYBZK9lpkfN6gd/od71uyJsnBL7kiN68ugbBVUqLZ7LmqdSiNXDV1Yj4DvOZwQRW9XwMIMViyWxk8hqqmXjTRX3+hmbxqdrVR4jb9s+7eKuJAc3gkSp83ZLzyhp8ApOj4esN+NQzKnA4n41e0=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91bd316-fc00-4564-a796-08d8167b3ce4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:09:43.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pEkLxqUszgRPLuDYda1ZRlBQVWVH5LuNXGT8inNT501HL5BIJhqHSt/9UyeV4yD7cSRgysUrONOVfDRsRckXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5726
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:11:40 +0200
Subject: [LTP] [RESENT PATCH 0/5] tst_net.sh: Remove rsh,
 update docs add debug & test
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

From: Petr Vorel <pvorel@suse.cz>

Hi,

It looks this patchset from Friday didn't get to the mailing list, thus
sending it again.

started as removing rsh, then also update docs and backport testing
environment I use for some time (but not sure if needed).

Kind regards,
Petr

Petr Vorel (5):
  tst_net.sh: Remove rsh support
  net: Update README.md
  tst_net.sh: Drop 'sh -c' use from ssh in tst_rhost_run
  net/test: Add basic testing for tst_rhost_run
  st_net.sh: tst_rhost_run: Add -d option (debug)

 lib/newlib_tests/shell/net/tst_rhost_run.sh | 25 +++++++
 testcases/lib/tst_net.sh                    | 37 +++++++----
 testcases/network/README.md                 | 73 ++++++++++-----------
 3 files changed, 85 insertions(+), 50 deletions(-)
 create mode 100755 lib/newlib_tests/shell/net/tst_rhost_run.sh

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
