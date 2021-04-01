Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB4350E4D
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 07:00:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62FB73C226C
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 07:00:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 733D33C223F
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 07:00:15 +0200 (CEST)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 14E881A01125
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 07:00:13 +0200 (CEST)
IronPort-SDR: iNQV9TwR7lUYESb4ywhYIqn+77ahz+6xZIPmLT/B89JRuaF32/k3Zar7RlDuNSlISUyoR2w9NH
 Ih0ynjLTXiQCg89chJ8pGDHOw+MIBM4b6is/sHH8gayl5Kty5gDt20AAs8UDjV62DbxtJePupE
 qVUmN31ikgTkz/BazeizA+SvSPj418Z+UV2Scs2G97UC4xyLqyuTqbDVGuz+m/X+l7Z8mOj/uJ
 a8OOLk5GpmMUmcImcJMtjFarGcLX36M+Bcy8EkQKE08KBV4+8rykdI8Boh61MOBJx7IbFlg2Tv
 dUg=
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="28889533"
X-IronPort-AV: E=Sophos;i="5.81,295,1610377200"; d="scan'208";a="28889533"
Received: from mail-sg2apc01lp2057.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 14:00:11 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPdB+1rGN8v6mlUNDBtAFOBZYhJkvbs+zaH/siyzxdGt3CppuqrMuGMm/oQVIQ6dmjchWWFb5gxFHSlywrs0jSbc3YLWHM3x+cx4DpEp+4J2uDTZw8SrBPbE5ysT+4LDKiGPwyqoWWQsMpaZUvP/IpCexzGmrpakY1ksFKwHUISZsSUspfSGhfL/gVjkcGFB5cVBO2IJTYVlcRoEHQEKIKivWWf860odJm08ubugoYryMSe8OWjN8ljuzbn2o5QV+HcT/mpTgFm6h6JajI9OHMFXikCFtaCpR2y9qKdmLNviVQbc93tzDwqc6XQz/Mdg81yAOAv+cd7PBeDkhuHdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSmRxsVIko+VEUpgcAyxGAS5mAJeaLrfzWnmQa01eHU=;
 b=m0k2UWv8NJAxJRnYtG1ERGTdbnJTXKZtQSMmjg6OBe1BE1MMBm4k0erTqAflQ1N9//NH2wUXhOSPc89IfZPt3G1qSYdlcR3oPcytIhWzb2RbylpobJM2acENApC6JgCBtPdFxxNa/k1qhp3stJvTMxP9ZK2JkFxvh4dZXyDZz9XzIpT3hc/o9LtvB0AqEC04ePhxMG3ocd6hiDEh0u3tTGWHRrqLOqecj2O8vFol9FL3SihHXlc+hvxy6iCrMzbejAVb3wc6qqVzw0rc5yHikPgBYyoSCcrlOslBkSmwr7PJDjtTG8d9AdC7rAu8QXazyEkZt+u4SZGjQPh1bknEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSmRxsVIko+VEUpgcAyxGAS5mAJeaLrfzWnmQa01eHU=;
 b=gfS7bd2FOiBqVQzXja+vktMoTCbftYeXlZHVx6sqqGpTi9KHuymkJSPOEqMAKzwPsNT8a40eq+T+3BoDWZYviJwL3x0avJXHCeCOxTb/O3+KzWURP30OcipfZTQSgGJKKXw84vphn8F7SNnh0R9WtATI9zCJaFBlI/X0DUCgH9U=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2331.jpnprd01.prod.outlook.com (2603:1096:404:75::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Thu, 1 Apr
 2021 05:00:08 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 05:00:08 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH v3] syscalls/ipc: Check that whether if kernel
 supports *_STAT_ANY
Thread-Index: AQHXJS52Fj3GDIfNb0SzZ6egxU2SqKqfHXcA
Date: Thu, 1 Apr 2021 05:00:08 +0000
Message-ID: <60655364.3080900@fujitsu.com>
References: <20210330063200.23654-1-zhaogongyi@huawei.com>
In-Reply-To: <20210330063200.23654-1-zhaogongyi@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85629612-1dc0-496e-372d-08d8f4cb05c8
x-ms-traffictypediagnostic: TY2PR01MB2331:
x-microsoft-antispam-prvs: <TY2PR01MB233109F470237DD71E50EB6DFD7B9@TY2PR01MB2331.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p1ZwX3O6Kwf7LKtAsNzHCECadwU3MkpAloLNnqrZ5hKBZxXvm67QO99mPCWglqdAM1WxA7dxwc0PO7+YFkoMyB494qvJdW63gxKNBSIBbmKP6e6kzluwrLMooHTQ3lepPp3wDxUw7t6EHAZ7BNbA4RE1ZqDLJKup9cou9KRUASk7MW44Qfv5lNLkLD75AcVQejwvA6Ie2gSNWBTXyjBFAAPlN9DNW31jDpqBZhKOjAZFyJ2q/Ff325Vd+urDEO1S+lx0EYKXlLzZ4Hucc9siSCUlYl5eA4wiy9RC06hYBVFxzKnS3T0MAMwnFfcx6BukUgzmCYnJMVKHQ0FuSBZ32mnxdeFrHjHddIjPymGw8x0Tvm3x5QbDPPnOAYf3o0YtMwgLvGmX6fpY/Bemsrb3WhlzOhpQYCNm+/dJnOO9OsPzfDR6ax6e7aYgWuKEt14hcGJVubXU4ZSqOIoVirTnbnmb1W5Iw6q/XSA2Z12vXGDbmcEcB277wiKR9bkjHIG18pJvjlF3zL0agaV+BhcOoVOqdeSJyiGXnAzht/xZ8V+GS6d3RFtLhLWsAWv5emVUfjbjUtrfxJc/tT4dzzzoNsQCmSSP/F9LP0zUcjUs4P5dY5jBDC6e993hxu+Q7P2E8TwNBMFBAbbb+f4NuZ9sgW9cW/de+U/OB+aiO0Yjz2ZBO5DrZWV7Tu53675Yayjj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(4326008)(87266011)(8676002)(66446008)(186003)(6506007)(38100700001)(6512007)(85182001)(66556008)(5660300002)(26005)(316002)(71200400001)(2616005)(66476007)(478600001)(6486002)(36756003)(66946007)(8936002)(76116006)(91956017)(6916009)(86362001)(2906002)(64756008)(62816006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?WUhJTHpNbTVrTW45UC9TRlVwdElKMWRROGVOUXNMdFE3QTBXb3l4Z085R0NL?=
 =?gb2312?B?OUtFa2R5ZXU3cDFDM0xYZUlmTXVtOFV5R0d5cXpJOUU2alNXQlU4WlY4a0VK?=
 =?gb2312?B?QTJNN0c0ZUJLYXdRUGlmZExhaFNtSGwzckdQZ3QrOFdOSk1TU1VKMnZvUVZy?=
 =?gb2312?B?MDluVVZOUWY0ZzR0ZFhyeFl3YmhEQjBSVkd6aVlST2JlOHdnUldUaHc3azdM?=
 =?gb2312?B?cWdkei9MbUkxdVB0UXM1QkRZaTJsTDFVRVRsNUdYclhFdnF6dFZEL3Fhd2E3?=
 =?gb2312?B?Q1J6YURkeFM5SGFLb0JNYmtTNThuUmYzcXU5dEp4NUxzYUxuYk1jeExDa3dF?=
 =?gb2312?B?bGMxVXZUdGhMTmsyYWZmS0ZxaUE3d0hENXVkaU5TRlkxVjRXNU84R3ExdUlZ?=
 =?gb2312?B?SE1ob1EzTHQ0QkRHdm5iUlI4cDB1a2p1Yll4cG4wcnFTVmIzeTlNVzZOQlVH?=
 =?gb2312?B?eGFxS2gwQ2VkeWdXaGxVeU1UeE1VTWtqT0RoKzB3ZVRqOUlMYTVGNHg3ZFFu?=
 =?gb2312?B?eUhPcXJpdEhDa3M0NnF0R1puM3dtV2NYbGRwaVM2VWhmU1B3cEFEbC9Pck9V?=
 =?gb2312?B?dVhkdmpaOE5jNERxcEZlaW0xemVWSTJzK1NtcnpOTmFsMDVvOUJRU0YySFhB?=
 =?gb2312?B?YTBMV0MxU2pGRHZ6OWlrbHh6VE91NHNYdmprWXBVT0cxbWN6OEVKUW5BMTFE?=
 =?gb2312?B?dUZoWHVlREJUSVBlZmVpSURYU0JuK1VPR2ZYU3pweitJQTBqM1c3V1F6aE9J?=
 =?gb2312?B?WW1rWG1INW9QYkJla1d0T2tMSVhmZnNXQ09SS3RQV1pYUkNJTEdqS09iazVy?=
 =?gb2312?B?MFFHbWc2cUZLWU9hbnU2YUpibldvK09QWVB6MFhiZm03RGhEVDFVcmZiQVZa?=
 =?gb2312?B?aGtZK3VVNG82TjZEcTNnK2kvOGNaS0NVYzZ4amlLUVJ4dndQTUFhaCtJc3pz?=
 =?gb2312?B?QlFQNjUreThROTd2K0pSMEFNNVMvVkhTbmtOTzJuNmZKTDVHNVF5T3VibjhI?=
 =?gb2312?B?a2lyODQ3U0Y2OVFObGU4VDIvVE9FUzdHakdzcHZlNnN2RzdkNjFUZ25rN3dB?=
 =?gb2312?B?czZjR2l3TFhlTjIvYWdmUi9CeEcxTXV5dHRwbVBLOTJObU9LQ0s5SWpnMXMx?=
 =?gb2312?B?R1prL1orVE5uWEdNUXZtVzh2TkZvaDZxV0hOTFlNc2h4SEpmdXBKVE5MWGVB?=
 =?gb2312?B?K2FBUUM3c2pnYU9DWERKNlRvbEt6SE91MEYyOWV5WmRDQ05FeERFTFVKL2hJ?=
 =?gb2312?B?NW82cUxMSzF5SGwvM2dOWWtFU2RVV09DRm5LcFNCcnhwWk03MG9ROU12Zlc5?=
 =?gb2312?B?WUJFNUsyQlMrL3pUTjB1WXIvR1BJemhCOERRenZVWVRrNGNWb0VNWkNxeFh0?=
 =?gb2312?B?MFowUDJjSDhtYWJ5dVE5aGdyTEsyZ0N2K3Q3WGVOeDlBTUF4aHBrNkFGVG5s?=
 =?gb2312?B?eDdCTy9tY1lxR2JvV1pDUEUvVFYxUmtJSm1BbFRNdGxKZXFvYnAwelNsSEsv?=
 =?gb2312?B?L0o5MitsODFnOXdjUDcxWXppRFBjajF3WnFtQlRzdHZOQWp2eTQ4em8xdDY2?=
 =?gb2312?B?RGFuMTZnZUsydGV0YkgzYjY2S3cycHVROEhlQ1M1T3BkNWtjUnRKeWhKQUpL?=
 =?gb2312?B?MCttckMzU0Q2bnp6TXcxWnliTUJpNFdYZW9FRXRWTG1uOTFRSC9rL00vaTgw?=
 =?gb2312?B?ZDVsdlN2UEJrVFhYNmlLTngyc0w2Y3VNekQ0RUJTeVlsME1yRG8xRHFsQXM4?=
 =?gb2312?Q?Uihdt/xl2OESdSmTBAnO9ocHNEgqRdCazC//wrN?=
x-ms-exchange-transport-forked: True
Content-ID: <792B9896C23CED4496E89044CF4B44C9@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85629612-1dc0-496e-372d-08d8f4cb05c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 05:00:08.4286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1iKT+IMDVg47l07ORlD7dpK6QCZsQBxUESGtHJnnMwODDg9Kq4mNHlgfnzJnofTaJaEEX6QkPnHPxdc3YzNz6COV9qsYLL8G4z9HICMuFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2331
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/ipc: Check that whether if kernel
 supports *_STAT_ANY
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Gongyi

Merged with following changes, thanks!

diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
index badbaaede..6f5476383 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
@@ -152,10 +152,8 @@ static void setup(void)
  			tst_brk(TCONF, "kernel doesn't support MSG_STAT_ANY");
  		else
  			tst_brk(TBROK | TTERRNO,
-					"Current environment doesn't permit "
-					"MSG_STAT_ANY");
+				"Current environment doesn't permit MSG_STAT_ANY");
  	}
-
  }

  static void cleanup(void)
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
index b40f5ba8b..efbc67f33 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
@@ -196,18 +196,15 @@ static void setup(void)

  	TEST(do_semctl(sem_id, 0, SEM_STAT_ANY));
  	if (TST_RET == -1) {
-		if (errno == EFAULT)
-			tst_brk(TFAIL, "SEM_STAT_ANY doesn't pass the buffer "
-					"specified by the caller to kernel");
+		if (TST_ERR == EFAULT)
+			tst_brk(TFAIL,
+				"SEM_STAT_ANY doesn't pass the buffer specified by the caller to kernel");
  		if (TST_ERR == EINVAL)
-			tst_brk(TCONF, "kernel doesn't support "
-					"SEM_STAT_ANY");
+			tst_brk(TCONF, "kernel doesn't support SEM_STAT_ANY");
  		else
  			tst_brk(TBROK | TTERRNO,
-					"Current environment doesn't permit "
-					"SEM_STAT_ANY");
+				"Current environment doesn't permit SEM_STAT_ANY");
  	}
-
  }

  static void cleanup(void)
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 9a60c5170..724610ef0 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -164,12 +164,10 @@ static void setup(void)
  	TEST(shmctl(shm_id, SHM_STAT_ANY,&temp_ds));
  	if (TST_RET == -1) {
  		if (TST_ERR == EINVAL)
-			tst_brk(TCONF, "kernel doesn't support "
-					"SHM_STAT_ANY");
+			tst_brk(TCONF, "kernel doesn't support SHM_STAT_ANY");
  		else
  			tst_brk(TBROK | TTERRNO,
-					"Current environment doesn't permit "
-					"SHM_STAT_ANY");
+				"Current environment doesn't permit SHM_STAT_ANY");
  	}
  }



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
