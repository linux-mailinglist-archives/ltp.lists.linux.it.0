Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5727C2B0B60
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 18:36:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFBBC3C6592
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 18:36:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A8D7D3C4FE8
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 18:36:49 +0100 (CET)
Received: from de-smtp-delivery-52.mimecast.com
 (de-smtp-delivery-52.mimecast.com [62.140.7.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 10DBE60029B
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 18:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605202608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aVH7Cs/iA5ifMcnUCjgS7GkvKCfROr9O4pgPfIeZjAY=;
 b=ZeBJn/TRJOf+2oId5Zqiqt5yB6e0EOuFArzTCOXkHJ7+Gg1r31ylivo9G017Pgv/CWImg7
 SL8wL4GBmGGPT2RdAouBUwq/4oW4CMnkG19ox0avVCiL2+uzKKdLuvb01RGT+XAruHvQwS
 6wzX0z1OccQ5SzDlh5f3zsdm8d9H1Uo=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-rtc9FRn0MgeETyUOfoulMw-1; Thu, 12 Nov 2020 18:36:46 +0100
X-MC-Unique: rtc9FRn0MgeETyUOfoulMw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/NgouazIIQTB0+/Fu/ehyfrOntAiQtp+9E6U0iv4wUKrBuuTakhTw5dPdPUr2f6vRllmNFuqjEVBkePOWC+XCBUIKGfKsjyw5ClVF6w/fH43IRT66CoOlGMRXZ2z3pKDGmIzjSFSd4csqRvxcWXUDTHwbTkB/jzPbpe/d3kMfwc9RE0nTVa/+hJfPWLI7VF/J2dnziOcEjcKF7JAE02V9AQ9yDvLdSZMPIIrOp9gXZAwpWVVhwYQMO9jGa2w+Be0PqBvkkA1SP1WlYwhtelNtbSwC2Ldf+B+EtFql2lEExfsAyXZhH5nHYGHAg+W1vL5N7KRA8BK4jsO3jVoI4KJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3W6Ow3zw/d1Xdd1t2PTOmXWMUGkOc/9mjJ84padbeM=;
 b=OuktYY8D02/iYe/hkFhy1XlorKyO/QyXlyj6bP0eic5P0NZRzvZE8DsRHWIC3uk5t4wsXXqr1CCWA73TW/aIyKu22pJntKnL9FJ6GUrvuvTrWq0U+EdNv/nBcj4cYEVWEZ8NvKqNqkvRqJegzDvi66L886RdhOQno+wKqcbDkODqQ8Dt5KUJ7zoulq1ZpseCP73A3K6+hwHX9ePidO7/gQiDdJMd+AOSZGXxBSYbTsdk1f3g3leCC6k+TZypDYKlSC2wjzPjynzXKYG22VUseVohrEnVEDXin9fD+yen6xqNf+fPayB8o8M+RhudzZ4amfXMayshCWQhKFKFuIB+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB4687.eurprd04.prod.outlook.com (2603:10a6:803:72::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 17:36:45 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::518f:b938:cc01:c392]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::518f:b938:cc01:c392%5]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 17:36:45 +0000
To: ltp@lists.linux.it
Date: Thu, 12 Nov 2020 18:36:09 +0100
Message-ID: <20201112173609.4123-1-petr.vorel@suse.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [62.201.25.198]
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To VI1PR04MB5503.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dell5510.suse.de (62.201.25.198) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 17:36:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06dc9756-7534-4c9b-942d-08d887318616
X-MS-TrafficTypeDiagnostic: VI1PR04MB4687:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4687026FE50F49F7DAD4BAF4FAE70@VI1PR04MB4687.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9KLy6xmpolExzOnZVhcUaTHClbVB4Bat81cwGP/ho3/kjDKftnw1zsxdaAN7u2D+92oL+VlutUJNgrbRsh/V9psLCnA+gXighkC9FN8whgEtZvbcRLpTD13zUA6P8HVHns/BnVt/tYl/UPoEO0nWt+SyGXDYQGC2WST/pS4uvwBwBpi6vIM7tMfTSAHXvmJrwZ+JIrgHl7/LibWGrLP8jnsWldRL3pVmxJqZtcIaZjKT/a5s0jQxIT2/wHqb6bu9O+nEUDqgoKt92rX5ME2idAB7iEKpDJAiHFCMCKcs6LDf0NE14K31FXWMadHV+tvFWMiLQ7ZWcz2RxQXyFGmshMu+sfdI49ko4K52jOf/UI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(346002)(396003)(136003)(956004)(16526019)(66556008)(186003)(6486002)(6666004)(4326008)(66946007)(316002)(66476007)(44832011)(6916009)(2906002)(36756003)(83380400001)(6512007)(478600001)(6506007)(52116002)(2616005)(5660300002)(1076003)(54906003)(8936002)(86362001)(8676002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OYlIhDWUps/oOALRLkWKdpfhIWd7N3UX/CS+lOYFDMByHVmdy5xhwYSByyusRA15II8j139VrGkLBv63hIMN0JjLgPsuNhaLL1ziIHzF5Bwr2dOPb4XdsCTURAjXkmf+/7P4LrJUxw17jXt3TX3m4nBsMQe1RFXqQurUvbB8OsZwOtW4xQ2vonutfRZhndoDGtR4CU1JNAvuv5humWqu+BsfSf5Qtb0uV5dqkNVIoL43+7JPdup1G95qUe4rrKpowJcCI3eeudt8fcRoGSZvTSzMwVT1T8W26WUAAO/iMR7GVDfcDLAhX1RabEmIHhA6VWO8zFN++zsKHOT4PwWXJpBeR+u1kW5o1pqCBxEcF86TWrK9lxHtG1lu9I0Tc4yb8tA+H5mxVVOME8hhko3gl8yDQdogGy4GAHxFCf0I0J/ymrpsbKdWBYnY5YAof2PrP59iF4L8thdmVEKP1IJ8gWY65kDE1+dp7F6JSTL7VhKjKl7FXzFyBMDW5FiJY9MeBrmymRTAkmT+BoKO4X4gPM4KKHE+/1/yZdapIw4p/h8EepwcDFLx0I4HWjbk/WjXFrgG0HspvnZ4AGyRYRUMc2V5YBpkquSotThE//U0+WkMyRMD1Dor8hVSiNxXoFHAB9B+2nt3VrMPipr3QC+cdA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dc9756-7534-4c9b-942d-08d887318616
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5503.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:36:44.9696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qkUgVwbz4UzrCvyt3ByJcDK1Z1vfRSnHButvoDoreIk5N13hsbI9TgkTm1l98pKPdja1oaDqMSa3tt4NBBpqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4687
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] net/traceroute01: Check also -T flag
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
From: Petr Vorel via ltp <ltp@lists.linux.it>
Reply-To: Petr Vorel <petr.vorel@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Petr Vorel <pvorel@suse.cz>

and move checks to run_trace()

There are 3 traceroute versions:

* Dmitry Butskoy (http://traceroute.sourceforge.net/)
* busybox
* iputils (only tracepath6; deprecated, but still used (e.g. OpenWrt Project)

-I is supported by Dmitry Butskoy's and busybox implementation
-T is supported only by Dmitry Butskoy's implementation

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Alexey, Kory,

follow up to Kory's fix (there are some problems with suse.cz
mailserver, thus I haven't reply about pushing your patch).

Kind regards,
Petr

 testcases/network/traceroute/traceroute01.sh | 30 +++++++++++---------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/testcases/network/traceroute/traceroute01.sh b/testcases/network/traceroute/traceroute01.sh
index 38f4d3b85..90030af39 100755
--- a/testcases/network/traceroute/traceroute01.sh
+++ b/testcases/network/traceroute/traceroute01.sh
@@ -13,9 +13,12 @@ TST_NEEDS_TMPDIR=1
 
 setup()
 {
-	tst_res TINFO "traceroute version:"
-	tst_res TINFO $(traceroute --version 2>&1)
-	[ "$TST_IPV6" ] && tst_res TINFO "NOTE: tracepath6 from iputils is not supported"
+
+	TRACEROUTE=traceroute${TST_IPV6}
+	tst_require_cmds $TRACEROUTE
+
+	tst_res TINFO "$TRACEROUTE version:"
+	tst_res TINFO $($TRACEROUTE --version 2>&1)
 }
 
 run_trace()
@@ -24,18 +27,23 @@ run_trace()
 	local ip=$(tst_ipaddr rhost)
 	local pattern="^[ ]+1[ ]+$ip([ ]+[0-9]+[.][0-9]+ ms){3}"
 
+	if $TRACEROUTE $opts 2>&1 | grep -q "invalid option"; then
+		tst_res TCONF "$opts flag not supported"
+		return
+	fi
+
 	# According to man pages, default sizes:
 	local bytes=60
 	[ "$TST_IPV6" ] && bytes=80
 
-	EXPECT_PASS traceroute $ip $bytes -n -m 2 $opts \>out.log 2>&1
+	EXPECT_PASS $TRACEROUTE $ip $bytes -n -m 2 $opts \>out.log 2>&1
 
 	grep -q "$bytes byte" out.log
 	if [ $? -ne 0 ]; then
 		cat out.log
 		tst_res TFAIL "'$bytes byte' not found"
 	else
-		tst_res TPASS "traceroute use $bytes bytes"
+		tst_res TPASS "$TRACEROUTE use $bytes bytes"
 	fi
 
 	tail -1 out.log | grep -qE "$pattern"
@@ -43,24 +51,20 @@ run_trace()
 		cat out.log
 		tst_res TFAIL "pattern '$pattern' not found in log"
 	else
-		tst_res TPASS "traceroute test completed with 1 hop"
+		tst_res TPASS "$TRACEROUTE test completed with 1 hop"
 	fi
 }
 
 test1()
 {
-	tst_res TINFO "run traceroute with ICMP ECHO"
+	tst_res TINFO "run $TRACEROUTE with ICMP ECHO"
 	run_trace -I
 }
 
 test2()
 {
-	tst_res TINFO "run traceroute with TCP SYN"
-	if traceroute -T 2>&1 | grep -q "invalid option"; then
-		tst_res TCONF "-T flag (TCP SYN) not supported"
-	else
-		run_trace -T
-	fi
+	tst_res TINFO "run $TRACEROUTE with TCP SYN"
+	run_trace -T
 }
 
 tst_run
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
