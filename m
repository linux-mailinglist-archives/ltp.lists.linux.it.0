Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70A203125
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:59:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 113983C676E
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:59:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 63BB23C6769
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:43:50 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30083.outbound.protection.outlook.com [40.107.3.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C8E821000CD3
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:43:49 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of233uDvY19GQK85oyUkAOu7YjB8tLRJKGL91bdxHRZ43XdNHAuW7AK3xUQqxfNuPX132sTnM24ctB+I5OfvbRQcUN89SWIMg9/Wj3vRMHpfX9j7jwJu6Z7AmN4cB6DgT8FqnDFD/PhaNRwifiBkIw6fci9hfoz4ZjNGQVx+M0rpg+5IYqawRIi6yvtEiSbjT75HaIxcuaOW6UBS2beNoadsOmRONsU892oKjJSV43PqpGoN5Cn5ZMrwYH9lCmTeft2xNnv63BhgK9B3zp+PlTnHGckH0eILRfeac99zbjTx9z+LlYE9b0gj/77qmv9zV2+hhG8JAdXoMfmfXy4ssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPPxtAzyPNh8hnoN2iKjGQhu8zQuBkvMrXg8GDHc27A=;
 b=M7wdyRdzgQy9bKdwN3bIHCByP1ERn8etnzkSSd1e6J7QUeIKrxWcUUdK/nKpBZkxq+phhGz9AqwlPRFMHNnLwwOuIadfITHp2CYQmtu7K+qe8nJe810Hl3+nn/0EfYZXNIPe9JJAmNMc6UlELXRgyc9t8TVvYLwBHlBhou/uijeZMSgJaB/ETe4ayD+UHDGd8kSc0iVGv7DWOzOBJJNduYlP32JXhf2xw1cOIep7LF2Pk9QK827aHp/5slxf8ja6nLJanQfDMuKsqG7OpX3ojF+rrfAco0awPsu27Gb5tbR7Z4t37jWBen+ZhywZVyxuC0XPmhxkKYYTDNJYWLG3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPPxtAzyPNh8hnoN2iKjGQhu8zQuBkvMrXg8GDHc27A=;
 b=eGFIo7H6KpxZYtmvzY73nHGzn20hEVa7I0KLM8BQCtHhfF20TQfzvk/EvuRj/XD2pukpN35BCyoLO7KhrZPoNdsc3vLDSVVsLgnb4bi9sXt7V5Tnk5862e2dAA9urGMccNhnpqlR2bphDcJgZ6N/0sY1Yzv5HBgWIW2z/xV5F/5ANXLk66blbqqHkStU8kHs3O2FzdqRwyaUzJubUYUh8YEyL8/8VhGvFkkj21m/b+nVv5a8YCtjS00LwUwi/15NA5GLvk2MKv/1NDNbJosmVcN8UsqSYFFzTZL9g/KancUXlOcmnLJGB5UpKNfrH4HFONagNn3hzEE1N4zaP0tmvQ==
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB3133.eurprd04.prod.outlook.com (2603:10a6:802:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.25; Mon, 22 Jun
 2020 07:43:47 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 07:43:47 +0000
From: Petr Vorel <petr.vorel@suse.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 09:43:14 +0200
Message-Id: <20200622074314.22098-2-petr.vorel@suse.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622074314.22098-1-petr.vorel@suse.com>
References: <20200622074314.22098-1-petr.vorel@suse.com>
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To VI1PR04MB5503.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dell5510.arch.suse.de (62.201.25.198) by
 FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.23 via Frontend Transport; Mon, 22 Jun 2020 07:43:46 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c67a436-6fea-4d5e-0f7c-08d8167fff30
X-MS-TrafficTypeDiagnostic: VI1PR04MB3133:
X-Microsoft-Antispam-PRVS: <VI1PR04MB3133A117A801CF061C2164EAFA970@VI1PR04MB3133.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCp9qZlZGKfrqMw8JBUPFTcCg1Wy8tmzOqA2LhOHufhaUWARzSjsfivExeXekrAQO4AExeddJb4QC1j8jFzAg6LBjimfM+9SHEBJRIPcC96suWHl6VqKvzWNAG4lCtWV78g6BqLVyYy+hN8/u/oxa1u8iCIFGsJQ4iPISH8wqNOZavILY4zEffsKYNC+UFFd+2khbPCeldN/p4x6gif++l6zP4RpxS/KZIVUc6mekm/KAgNwn3hzc1Rzd5NSvBUxS7N3kqs48K/HA5UUXmkl9AUS2epb2cbckA/NRWkawnsicNG48Py+KT5sUDu+LJkbFHOFn1dx339eA/ZoOnGzHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(136003)(376002)(39850400004)(396003)(52116002)(6916009)(44832011)(6512007)(83380400001)(2616005)(956004)(16526019)(316002)(186003)(5660300002)(26005)(6666004)(36756003)(66946007)(86362001)(6506007)(8936002)(4744005)(4326008)(54906003)(2906002)(478600001)(1076003)(8676002)(66556008)(6486002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 2TUB6UNrlfcT6adY7xEviCKw1MMM9zD28FFd5ymbrkCuVjb5482UEMs1rGLIsleBp6o7xX6NPnxW1XpILsVvLSExQLxl8ERW/iJ0O3rU/sbdMFj/0puzfd84Xt8LBmJW0JrlMMkXaBI5TwRx1BUblhO7iWI2SU0kU7p7Mwz2sX+yXFxWjtuVCFIiSAZDWERL/0JJeTaCwX1zYxK0MVbkQy/fh4QXpHusPXgWytjIMzXKDybsA2D21f2yDJeJDQYrq/hYFquTVVShQzNPNvqUqBeZCFSp8mFSxTzSryqsTRwNbWSDbs5DSSU0txghmxzQsWviftflVtjtCXQMCxRSMo33owWVgTjZOfuPOLB7rP7vmTN8CeP6vRDb/nuNSERpdIiuROVMZcylkqNQQbZS2qFsgGdKTOBWOezQqbvID4kNHz8XDyfQYYPTuTdv56OuyBMcuFCmbl0DUz+7uY9IKR2rzCqMeR9QoRsRRZJ3SGo=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c67a436-6fea-4d5e-0f7c-08d8167fff30
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:43:47.2221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTLLTmMpdvQWT7jzQ2SspgvhkeV8JLfc7jhSAqYsZmk5hSbAhrPykm4NIw4tM4x9qKGphd0c9SFKqYfnpyiYuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3133
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:58:50 +0200
Subject: [LTP] [PATCH 2/2] travis: Add -Werror=return-type
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/build.sh b/build.sh
index becaf3619..7fd9683a8 100755
--- a/build.sh
+++ b/build.sh
@@ -9,7 +9,7 @@
 
 set -e
 
-CFLAGS="${CFLAGS:--Wformat -Werror=format-security -Werror=implicit-function-declaration -fno-common}"
+CFLAGS="${CFLAGS:--Wformat -Werror=format-security -Werror=implicit-function-declaration -Werror=return-type -fno-common}"
 CC="${CC:-gcc}"
 
 DEFAULT_PREFIX="$HOME/ltp-install"
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
