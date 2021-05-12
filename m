Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB537BB19
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:44:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 583FA3C8A8F
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:44:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF6403C4CA2
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:44:14 +0200 (CEST)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A3F4D20035A
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:44:13 +0200 (CEST)
IronPort-SDR: vdMoAbiVTD0MW/K2q15lGV2NwMxLDI2+BrJLeB5rkFemkzAF3X/j60WLeRoao/dJx6QcqS1hDX
 1MPBmpJ1S37JFmOOVi2JTJanoWfYFQTu6KmBGxQMvYMoOZEbQPh1BwWQVM6yQ/qcBxz83JnOT7
 4i23p4OLuGGdly8TsonpPi9MNCQpHPsoaWof+SjEjrACLIZJUzX7Y0kUCw7AtdUVCgoOwm4bwF
 gq0Eig3w94RgyRxOhxrfuNvbVIiPBtBsU2RYKhRmegghEie0R8BfIO2hJadgkB48b+op/gjSF9
 r/I=
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="39131835"
X-IronPort-AV: E=Sophos;i="5.82,293,1613401200"; d="scan'208";a="39131835"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 19:44:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTgLK04K7voCMAMCk/FaeLuewltwfTEr+P9wTlSTFwGVvtRN8k09sXCzglrArJNxRXloP4VAmSniqN9BlKPrZ4mwOIyJYcfK1xa90KV9bmskijeiqUCaDrh+yT8Lxa/sNgb6qRPiTHMTe6++RwZRcdEZxHclE93Wt+B3zoUi3gDAFwTappXJjlJX8gabLqGnWBGohT/V6t6NcSTNsQiWul7/N9ISeUAPwMkRWS5k/NStNR1/xDn+vAQuXvPBTu8O45VvRNEIhG+wEbXC0vq2ouJr3jSqWWpzxnYEPK5ysCrbCpmthQ0O5X2nQQmnNQAeS9J8Htua1kZX7+J7ClCp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HULSQGyklMWGnfTPIN6SGUOmAYN6PbIjf4qAGX09S4=;
 b=SbwsXbChKXid90tqwVJ8IqrdjuuWy5HSjipaZIiX5mvg1vV7jpGFMu4E2TAKP6fjcyQxFihdRk14XMoWfSeOnPfWzbdUb2HvGDBlQgv6Suf91e5O05xeiONGH5oXmwhY8DDpxuUYKbgVWZi8ZyBygvfwXxW7SLKMcHKcYJctQM2GOzSyN/cLMy3StZjIyjlL54SLJUKkRmLFiWmDE/IjP/j4PSoMZnwWYZvV6EnbEi+AqXQBK3YQjSHzPc8S2/9PZY9A15lem8yYTd+oqVI71Pdw46mLwAiO/V2TIkWLfHUjr1OI23jwGmhEKmioZMBlNp7k502XZirAzDdUO303XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HULSQGyklMWGnfTPIN6SGUOmAYN6PbIjf4qAGX09S4=;
 b=DpYvlt705AYrte9oyR5ShrB8WlgsDaTGGG21hsx9Zx4I1opi3OL9fTusGEaLHG/AQO4TEmaQk10iUX4npd8AIwqYNperXAw5UaQjbs1Df4z4U3jFyykaUU0DkEyvVYXP76mFDU3v1xQBQMhNM0S322WlLhI5/mN8fZZ6QRfj+TQ=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5850.jpnprd01.prod.outlook.com (2603:1096:404:8056::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 10:44:09 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 10:44:09 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH v1 2/4] syscalls/shmget*: Convert into new api
Thread-Index: AQHXRwwpzyqY+A1+/kSsod3vd4wLYKrfqYeA
Date: Wed, 12 May 2021 10:44:09 +0000
Message-ID: <609BB199.5040409@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-2-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1620809541-6891-2-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none; lists.linux.it; dmarc=none action=none header.from=fujitsu.com; 
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c4fe0a3-43b1-4500-a40a-08d91532dfde
x-ms-traffictypediagnostic: TYAPR01MB5850:
x-microsoft-antispam-prvs: <TYAPR01MB5850F49196DA82D5F610AF57FD529@TYAPR01MB5850.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c/aVL4dH9exno3N2gitW1sXsAd1fK2Ch5YNLVItS7dRke4R7kqOjZM7trVCdj5l8HLjxjWBEbjhfDca9x7Tvf6iAWyArP0IY8q9mHqXXBIH81V6xWWytdnflfbio4WmQ6TBjOx5n1jYXTHDDFsFSoJuauwEhbUvghZxPMXbkYbicq4loZW+eetlSFphFSEjl1/e0RxQ35KyzHc0Bush0ICr0ad7fEfJ6NS5Yl66T6rqtcTarUz103xzLTxegbC7iMRqVlbcoQHldNcbtB9i7xA3TZy3J9tv25ex21ub4LnnCA3wqtn5TZtiveeTczCjVFCyA5oA07F/0SOC1zbynIKFPSz+kqqPDm+dM6NRU4s4OZIWF/6pbuFLZjaPe6KAphjI5J+3PJQL+EbXAWjEaHC9LXHQtnDTa5nzfQ9/FTFaymtStfSygoaq6e0YdgxqnEsJcyo6IXxFTolz1J1AlWntNImCDCqNkKvaUrS4gg2elEyhJohs7VTlvDI2zEmKMVVs7CwcW95zpBv5MiSWXoowjPydHLmb8a04UnIx1xZTtGhTqr/geNTn+FcZ4J/daBPpWzYVQVgSBRxFBuRurwlIjYUUU1G5UWI5OCO65//o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(6916009)(6512007)(33656002)(83380400001)(478600001)(122000001)(2906002)(38100700002)(8936002)(6506007)(6486002)(8676002)(87266011)(26005)(91956017)(2616005)(36756003)(71200400001)(86362001)(5660300002)(316002)(66946007)(64756008)(66476007)(76116006)(66556008)(186003)(66446008)(85182001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?cW5JMkxiOVA2REdzYldQbkpzTUVWck40K3BQUHJoS0JIQkYzNy9VUXlMbzE1?=
 =?gb2312?B?Q0M2d2tRaWRxOS9LU3EzcXFMSGFpNFdycHNLYVVibHdVMHpOSFdSLzhza1F0?=
 =?gb2312?B?T1dEeVFha0RkcUpNMWdySnpCU05UWXI0NDgrc1paQ0tiZWhTVlF2ZHV5NGgx?=
 =?gb2312?B?eDkvcTROOTRSR3ZZbTVMNUlXVWduTmN5WUdCWkMycitrZU1pQ08rdDJ4b0xE?=
 =?gb2312?B?Rm1qQ3lyeVNSTDVCaXYwbFpEVUxlcU03Yk1aK2o4d2dPYU9ycXo0aWxKWS9h?=
 =?gb2312?B?NTltSFdZYzk2bjlGQnNiaEwwVUFacEEyYktmd0dLdzdFK2dBbWxXd1dqeTlx?=
 =?gb2312?B?bE5lMlgwMzMyL2JjSXB2USt3ZTVGc1dNT25TM3Z5SitwTVFla05HQzdMRzNO?=
 =?gb2312?B?SVpOb3pSWUNNTlZQdGtVUVQ3MXlrWkZ6SjJHTXRRbnJkOTFlUFFFT2ZQait0?=
 =?gb2312?B?UVBTTFVpVFVXL0pHOFRUUGJpNU5tUjhlcmhnTWVWU3Z2KzZia2RYaXBSQkdQ?=
 =?gb2312?B?cnc4dE53L1lITDltcit6YW5hOU03eHFsdEdETGNxSkl4VnFMT1FWMVZXZ05J?=
 =?gb2312?B?eUlFczBHZzBFcEpBUk5COWx1Q1RUZmV4Y0tKeW1lUDdsMkxwdVNBcFpmYkdQ?=
 =?gb2312?B?aEZob1VFSVVnUXFWSDkzcnhJc2d4UFJVdkNQTFczVGRLRW4xaC9jeTVxRWxR?=
 =?gb2312?B?cTM0Uld5SE5zQlk4TXdkYWhHTVhjYmd2YlpLYmtDQzJBZHdCcjVLODRmWWQv?=
 =?gb2312?B?ZUgyS2R1eGhib252aXhaczJGaG96UGRVRWJpQURWV2pjRHhtaWNFUGNmYTcz?=
 =?gb2312?B?RGdBcDlwYlBFOS9FbmViTThRMlhqdWdWejRzMDVLVWtWTGVJeHdzanl0dGdj?=
 =?gb2312?B?a056NkF0STFBaXVhdVM1aWl5Z1M2N0ZCUWdJOGRjbkE3MnRkdy83SGxaSWo0?=
 =?gb2312?B?NlVtSElFVWJEQXNIWVZzMnlHYmZTTzI0eHlPK0UyeEYxUzRWeXZwWlJwZlBl?=
 =?gb2312?B?UDRyeElTTk9SK0R2LzVYLzJ2WWNOdWtjbHVxOEtYeWNBanlBZVlGWGN2a2Zl?=
 =?gb2312?B?VE9kbGRFLzdoVDlCYXh3ZVdGbk1XQTRYRHpDYUpZTGMyZzhUemUydmtvbHUv?=
 =?gb2312?B?VGVlU3AwdVdPRm1TSjljWHVsRmlacENvK1RUbi9NaEc5QkpjWTkzbENDT01u?=
 =?gb2312?B?YmpOaDNUOXVTWXd1MWFlVGpIV1cyRkU0NXRYS1pzOGpCVmtZVjhCNDlWRFBx?=
 =?gb2312?B?Y213VjhNYjRkb3BueU1sR2RNY3NhSVNVbkJtY21STkJpVkxJMzc3SldiTlJK?=
 =?gb2312?B?cFBvVGxlQkhNRzVuSmtkOS9lN3EwSlJtSlhiSFFtWk9pVzhQcEZYRTBHU1Va?=
 =?gb2312?B?b3pIVVhzRHZNWlEzc0FPZ0VYNlhFOFpQcTAzRno2THErSkJ4VFRJT1MrUmZj?=
 =?gb2312?B?c1FaKzI0NjN4RVkvd2s4TEo2KzBpVmRhdFVqMC9FQjk4QjFVek9MRkNyVXp4?=
 =?gb2312?B?NmhFMXVDVllMTE1NOG5hR2YrZDhIU05wRCtnekZZYkNlRlRtNnpseHFmQUFS?=
 =?gb2312?B?RCtYU3UxTVFlTGxzOTByUnpSQjZFdHpTQWVYaDdhSGxGdFhaUkRBZmFVcEpD?=
 =?gb2312?B?WVBFbDRuNzJXcG9IU0VlTnI4Wnp2SmhucDluOGRBUzl3VGNKMGQ4YzlyZjUv?=
 =?gb2312?B?RmdPQU1tRmhMZk5sVFUzQXc0Ni9ZbWZrU051cmJLL0hIeEZJckcvQlliYTNO?=
 =?gb2312?B?TWNSdHRZNTl2NkFLaVlTbjBIUEJoRG1wM0hCcFFyOGxNcDdxcS9RazhKWWJv?=
 =?gb2312?B?c2Q2clR1ZTR2NkxpZVBEZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <104B46224CFB134488E067C822BDA3AA@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4fe0a3-43b1-4500-a40a-08d91532dfde
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 10:44:09.6998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4UpzLumTP1XvtfRu5zqbggaX63BG5tSCkfy+lB3HDBOq0fs6p/wCk3c6sxYcbway2Hg3S4pAxBaqFxF3qS4OqQ6oQ6VGW4HMyKELEtBLYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5850
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/4] syscalls/shmget*: Convert into new api
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

Hi ALL
> 1) merge shmget05.c into shmget02.c
> 2) Use SHMMIN -1 and SHMMAX + 1 to trigger EINVAL error
> 3) Use SHM_RD, SHM_WR, SHM_RW to trigger EACCES error under unpriviledged user

Sorry for missing EPERM error in shmget02.c(I will add it in v2 when you
have comment on rest patches)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
index a57904ce9..319d1e972 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -17,6 +17,9 @@
  * greater than SHMMAX. Or a segment for the given key exists, but size is
  * greater than the size of that segment.
  * EACCES - The user does not have permission to access the shared
memory segment.
+ * EPERM - The SHM_HUGETLB flag was specified, but the caller was not
privileged
+ * (did not have the CAP_IPC_LOCK capability). Also the caller's group
id should
+ * be not in hugetlb_shm_group proc file.
  */
 #include <errno.h>
 #include <sys/types.h>
@@ -47,6 +50,7 @@ static struct tcase {
        {&shmkey1, SHMMAX + 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
        {&shmkey, SHM_SIZE * 2, IPC_EXCL, 0, EINVAL},
        {&shmkey, SHM_SIZE, SHM_RD, 1, EACCES},
+       {&shmkey1, SHM_SIZE, IPC_CREAT | SHM_HUGETLB, 1, EPERM}
 };

 static void verify_shmget(struct tcase *tc)
@@ -91,6 +95,7 @@ static void setup(void)
        shmkey = GETIPCKEY();
        shmkey1 = GETIPCKEY();

+       SAFE_FILE_PRINTF("/proc/sys/vm/hugetlb_shm_group", "1");
        shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
        pw = SAFE_GETPWNAM("nobody");
        tst_res(TINFO, "%d %d", shmkey, shmkey1);
@@ -110,4 +115,8 @@ static struct tst_test test = {
        .cleanup = cleanup,
        .test = do_test,
        .tcnt = ARRAY_SIZE(tcases),
+       .save_restore = (const char * const[]) {
+                "?/proc/sys/vm/hugetlb_shm_group",
+               NULL,
+       }
 };


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
