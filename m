Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B934DF97
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 05:55:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A17A3C8D01
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 05:55:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ECB7A3C4D3C
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 05:55:36 +0200 (CEST)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D8E87200B98
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 05:55:34 +0200 (CEST)
IronPort-SDR: VVJSmmR6WPg5gYU7OFtrn1lY6wPEbuvH9oEfKvkLSw3PYPxlBTOBhh/EZqC9wzQpkYUAp5Z7Gc
 scyqQumqF8lsGT3dO+KnVcJNWUaHrafbUXjvvWYCHYsCETt2ZFx5DwsdWc794Gl9kDX+IfBrz6
 fDuWqzTbbi2Wef5W6D9F62LZYiBcN0FrB0iTFA6OAZS5XTFZ9+NKeMRCXOJUEd9grDalXhcftu
 BJSWAUZh8OtxCpr2OKmWB1qu9WAZIJ1rVVTVuO2lh1Pio4CBg6/OWGx0GKmVDIfivbbv/g1xuV
 UJY=
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="36936127"
X-IronPort-AV: E=Sophos;i="5.81,289,1610377200"; d="scan'208";a="36936127"
Received: from mail-ty1jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 12:55:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmPBEPwndHNxcLfLufaEFRD1fmeHihlUYxvm0W2BjSvP1iwP2fw4AUp/rnkEdidDfQV1xTvlYkzta/dS2hhdA1FgeY4KSUSLNFXOxW8g1xoPHtCCz/LKTUc/Ss9k/7apjFO+fxEwJxq04uFI/1OGRHpkZ5CJj/wWKrkWuzoxotrKelzPSWkUP4kRt43ChmRQkl/k/OJiCLiHNtyA0rqBSYAAhXYRpsIjVtn5FjFjsatDvnlVyJ1VBs1szlQfSfVEm6Rut9ggpUKd2Tyl43Fbd+SdskNVrjdvKkmvlTA4dZ98Qc7Zxji5ySyi8MbsFwJPL3pC7JJzNJos+YllDzu8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg6Vc1uEKiNsl/0Nywwg5bJWridh8vQ0G+xWb2Z0Cc8=;
 b=Ox0dV2kBPodUUKZFcl+DrYWCB4y7Ip46XlvKlgMbhAEUnTTdFDVcxiWQpYf5u+2f55xKPGfptWOddmRsCo0MQ1M9gx40Xq42pRLQ45RovgbQj7bGrDRgtsoTcutdJFGkBvstlJ76pNq3dfvjy0eMove6rUqAB+SiplkUA78fG9kCRxdytU+9GoO0nW4dpdiU1PWMcqeD4E3Jy+YztLIYzljXnP7sB60mRKgq2yJp1jcaeLl1O3tqbxBeCzlVQQJ9imUzjnHH+skJdkvNt6n32LQbgUik0QvymuPPYiGbgGdLv2U8NkCsLaHqd9Fhkz5y1g16AeDMXACGTL+VKkG+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg6Vc1uEKiNsl/0Nywwg5bJWridh8vQ0G+xWb2Z0Cc8=;
 b=hDxQK2J+tFk9G0F08/yI6Tj1oqvLfd+S7agDwq8BwiBQM69o6Tk0pWcklG+oj8mC23gc9uuvvN0P/AjlEFDyFN2rTqxLuadMtOWZibrhQlK07TEczRVnC8FJplAdK5S0U5vsV4CAThwyWngGDGEKY9LjsHfq+8z/STt3Lo7L6pw=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB5645.jpnprd01.prod.outlook.com (2603:1096:400:b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 03:55:29 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 03:55:29 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH v2] syscalls/ipc: Check whether kernel supports
 *_STAT_ANY
Thread-Index: AQHXJRUc7dX5eqLbuUmN9sJ6cKwiEqqb5ucA
Date: Tue, 30 Mar 2021 03:55:29 +0000
Message-ID: <6062A136.9060705@fujitsu.com>
References: <20210330033020.27223-1-zhaogongyi@huawei.com>
In-Reply-To: <20210330033020.27223-1-zhaogongyi@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99f1cdd3-640f-45e9-4231-08d8f32fa8b3
x-ms-traffictypediagnostic: TYCPR01MB5645:
x-microsoft-antispam-prvs: <TYCPR01MB56450E01EE955826EB688E46FD7D9@TYCPR01MB5645.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4I2CRy/F9n/CiqK5VcDrOH+OgEgYnj7sa+kCxF6V2kZ+2MGMd0uyeTcIh4n6Rs5l2Bo2c/SNKIG9Hd3JvplyetpxsB3nsz9VdaoX8dgWGQds3Yf9q3rc3qi8o8IdgHliHL2nOqtNdLqnfV5x8Q9Eczng7KbWe0GUFWfljC5jujxRO4hBwDJHtHaup6BwJRy8fIF8zGx9Nq6uhHlVhzReCiVtLnTdNVGAD/Ly4Bt2TlA1039jrCuFEMkYxNCk1KveEVnGQphpQzNzTJgGqIDdoTuXrodFcTBjrpfuHQoicDnz8yW8gyeps7RK3wRs1fZ+e4XuMF9mtTk4JraSPSj01ZLQivmOg9V1zdpyBSIlIi0Tt9dJhxIK+NFYOdpxOC5kqIeb+PBci/AAdrz956GS9E5YHKh1xseeOABLO7FAEZMyf4GwytgTWXC2GsYPkPsymRJHXZanEv9Fh47BkZEZPbIbZR72RwTGaW0PtyhpbdSbcGDyIoT0Pr8k2cFYnHnIbzfA74LaEqkRrDGZev9Zk3ZjanQTr/LKw4JpNYIGlifBvEX3OMm2PBYkSTv9LeFGTSaF79HnEjtHnI0z7DtHsGMpWCi3ru+/4fgFB7xFngd3+PtzUbu9GmFGxMpTglWj0d9o/l+YLPxpJP0iLm5MJvcpnXhOyCwDmf0c7NuEVLo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(6512007)(86362001)(8936002)(91956017)(64756008)(85182001)(186003)(66476007)(33656002)(4326008)(71200400001)(66556008)(26005)(83380400001)(66946007)(6506007)(36756003)(6916009)(38100700001)(87266011)(2616005)(66446008)(316002)(6486002)(76116006)(5660300002)(478600001)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?OHE2RVJDUFhMbWE1VDExSGhzMlhaV0hPTVN0REx2UkhJM3NtdWEwOGV5Q3lU?=
 =?gb2312?B?a1B3QVkyQ1pTVytWZVhFV1kycW9iMVZMV3hYL2psdm50TW5xOHZMNS9PTHhy?=
 =?gb2312?B?M2JrbTFCM1llcnMrQTNLZlVnUVhzbHpBUVBZRjE2TG9GOUdtVjRnTHJpWDhS?=
 =?gb2312?B?VmYxM3BSeWNlTDl5MmxzVnU0a0trL1lJbXlOWVB1SnMyUmFkb0ZyOWluK0xE?=
 =?gb2312?B?K0NScDhwcVB4dStTaUJoTHM3UnVFbm16YTdoNmJKc3FsU3pUL3ljRlFUMWU2?=
 =?gb2312?B?VXY2TVBoekN2dWNLd09FS0thTkg2RVVKS0NWV1g1OTkzOGRzaDUySld0Y21j?=
 =?gb2312?B?dVdGU3VkaG9nSzNmd2tERGVzeXRFZ1EraXJwL1BxNjZXNFZpQUExdENhY0w2?=
 =?gb2312?B?NGxHbzhhNHJhQ3hLdnowTUpTUFl4OUZ5TWRwU2JOSlBySG92amlpeXFJdnlt?=
 =?gb2312?B?VXNYTkE2bWxvNVM5VXU1dk9VaDlUVzNoakVEOWVwYXB3TEc2K0RJdUVxVXFV?=
 =?gb2312?B?SDdjVGZHcEROZWVwb3R2aHd6b0R3cU05aXVPS2d1MU9TVmFsQXVLSmo4TytH?=
 =?gb2312?B?TXNhdURIcXFpVk5Pa08wMk1TRlRGbis2cEdsaSs4ZFhnTWd0ZkFjSEtzeUEx?=
 =?gb2312?B?c2lpWEl0eXVoS2I5b3JDaEVjeWJzcXh2SWlSc0l1bGVtRFBnejNVdHNaOHBY?=
 =?gb2312?B?ZjdTbHhxWVJSVVVBYzZ4M09uN0RUelJGWjJ6ZVA1Zmd3Q3JMWDU2eGVSWnIw?=
 =?gb2312?B?VlJWb0VxZHV3TXVMV1RaMWVaNkI3cDhCRjliS2pBODVoWVFZRFZwZmtVOXpH?=
 =?gb2312?B?WEpYZEpIeHVqZ1NMajB2N2lZdk1xSXFpMkNVSlJYWFh1VC9tMzVDdUN5bmts?=
 =?gb2312?B?WFBXSXNJclRtTkRiMEt6VXBFZWJCWlp2RTdsMnVYeTdSV0w2bUFEYmVnNDlM?=
 =?gb2312?B?RXRIYXRpSG1IZ2FjTDZpRk1DNW56eE8rWkpNaEljUFg2TVZGcjkzcnpkU1NP?=
 =?gb2312?B?Y3VZdFNlUFdlYzVIRWdZbmZnVkhTaForTGJ4M1hLMXd4bk5IMnk1ejYySjl3?=
 =?gb2312?B?OGVhNmJhU2hydjByUFdINVlKc1lJQnFjaVVXaHkzWkpoYUMrQXN1MGwyT0hT?=
 =?gb2312?B?L0FVd0ZIak03RStyM1NTQ2Y3aEEzNGp5K0hUZ1pCZ0hyemNxSlFvbXhIa2ZF?=
 =?gb2312?B?T2hPdU93S3ZzL04wcnI5VjFPVnNCUXdxTmV0MFdJN043bGs4SHFYaWNEdXJt?=
 =?gb2312?B?Q1dQWkhoSjdkUDRUaHRJMkxtYXg4eGI5bHVHR3hrRlg0SldmYjE0Rnl6Mjhj?=
 =?gb2312?B?MHBobS9uQml4TmNQUDcyRjIrZnAzS1NXeHlMbk1OK0Q1SnFJaVV1ZkZTYlBO?=
 =?gb2312?B?SExpMXpTRlhheXVlWm5QamphbWtEWlVQY0gyUktjdURaWUZ5emxsNEFDNDky?=
 =?gb2312?B?bThWQkN4QStKekkrQ2YrMk1PcHJvT0lzN1I2SysrbDBJeHpacW1TNm9rTmYy?=
 =?gb2312?B?RU5Mdzd6WU05YlBTNWh4Vms4MExySWFXdFpWOTIrWFZROURTaTNzNmNpV29F?=
 =?gb2312?B?QzRmVGtzRnlKb0J6elgra1ZaZ1FmM1JwbFZGN2tXUFVFY01rOXBaN2xNWEs3?=
 =?gb2312?B?aDIxQ0MxQmdHeEpoc3E5RkJHNDNNbWUwaUhzZFhnRUcycHRhWHRjZXRKcWxz?=
 =?gb2312?B?NEwvZThQOUxhTUtlRUNSQ0h6bzU3ZUVZUnJKd3pSaktOVTVUS0Y5QWRaaUU3?=
 =?gb2312?Q?5NogaGDSJTzUT4aCdssGbA6spjLW62DQD/Lgmc0?=
x-ms-exchange-transport-forked: True
Content-ID: <5519EB0FC70E784DACA6F48D306DEEF2@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f1cdd3-640f-45e9-4231-08d8f32fa8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 03:55:29.1819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Kexz3L9Aoo8Fi+iT+6dheQe4gmL47oKXi+tYLHZdG0A3eoXFfIF25z91oGYRFQYIuogw9K6ldLv/BvY3W9ShxmeAh77n0vWk42ZSqOHDMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5645
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ipc: Check whether kernel supports
 *_STAT_ANY
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
> SHM_STAT_ANY,SEM_STAT_ANY and MSG_STAT_ANY are imported to linux
> in v4.17, and some linux distribution such as centos7.8 has
> backported this feature, so we should call SHM_STAT_ANY directly
> to detect whether kernel supports *_STAT_ANY.
Also fix wrong TTERRNO usage.
>
> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> ---
> v1->v2:
> 	1) call SHM_STAT_ANY directly to detect whether kernel supports
> 	   SHM_STAT_ANY instead of using min_kver
> 	2) fix MSG_STAT_ANY,SEM_STAT_ANY similarly
>
>   testcases/kernel/syscalls/ipc/msgctl/msgctl06.c | 15 ++++++++++++++-
>   testcases/kernel/syscalls/ipc/semctl/semctl09.c | 14 +++++++++++++-
>   testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 12 ++++++++++++
>   3 files changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
> index 722a0cca0..d4ec4876a 100644
> --- a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
> +++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
> @@ -115,7 +115,7 @@ static void verify_msgctl(unsigned int n)
>   	msgid = msgctl(TST_RET, MSG_STAT_ANY,&buf);
>
>   	if (msgid == -1) {
> -		tst_res(TFAIL | TTERRNO, "MSG_INFO haven't returned a valid index");
> +		tst_res(TFAIL | TERRNO, "MSG_INFO haven't returned a valid index");
>   	} else {
>   		tst_res(TPASS, "MSG_INFO returned valid index %li to msgid %i",
>   			TST_RET, msgid);
> @@ -138,12 +138,25 @@ static void verify_msgctl(unsigned int n)
>
>   static void setup(void)
>   {
> +	struct msqid_ds temp_buf;
>   	ltpuser = SAFE_GETPWNAM("nobody");
>   	nobody_uid = ltpuser->pw_uid;
>   	root_uid = 0;
>
>   	msg_id = SAFE_MSGGET(IPC_PRIVATE, IPC_CREAT | MSG_RW);
>   	SAFE_MSGSND(msg_id, "abcd", 4, 0);
> +
> +	TEST(msgctl(msg_id, MSG_STAT_ANY,&temp_buf));
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EINVAL)
> +			tst_brk(TCONF, "kernel doesn't support "
> +					"MSG_STAT_ANY");
It's better to have a single line message.
> +		else
> +			tst_brk(TBROK | TTERRNO,
> +					"Current environment doesn't permit "
> +					"MSG_STAT_ANY");
Here as well.
> +	}
> +
>   }
>
>   static void cleanup(void)
> diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
> index 5a81f778c..197696df7 100644
> --- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
> +++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
> @@ -158,7 +158,7 @@ static void verify_semctl(unsigned int n)
>   				"specified by the caller to kernel");
>   		return;
>   	} else if (semid == -1) {
> -		tst_res(TFAIL | TTERRNO, "SEM_INFO haven't returned a valid index");
> +		tst_res(TFAIL | TERRNO, "SEM_INFO haven't returned a valid index");
>   	} else {
>   		tst_res(TPASS, "SEM_INFO returned valid index %li to semid %i",
>   			TST_RET, semid);
> @@ -193,6 +193,18 @@ static void setup(void)
>   #endif
>
>   	sem_id = SAFE_SEMGET(IPC_PRIVATE, 2, IPC_CREAT | 0600);
> +
> +	TEST(do_semctl(sem_id, 0, SEM_STAT_ANY));
> +	if (TST_RET == -1) {
Since here has a glibc bug, we should also report FAIL, so we can print 
glibc git url.
		if (errno == EFAULT)
                 	tst_brk(TFAIL, "SEM_STAT_ANY doesn't pass the buffer 
specified by the caller to kernel");

> +		if (TST_ERR == EINVAL)
> +			tst_brk(TCONF, "kernel doesn't support "
> +					"SEM_STAT_ANY");

> +		else
> +			tst_brk(TBROK | TTERRNO,
> +					"Current environment doesn't permit "
> +					"SEM_STAT_ANY");

> +	}
> +
>   }
>
>   static void cleanup(void)
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> index 9e8ec4199..9a60c5170 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> @@ -155,10 +155,22 @@ static void verify_shminfo(unsigned int n)
>   static void setup(void)
>   {
>   	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
> +	struct shmid_ds temp_ds;
>   	nobody_uid = ltpuser->pw_uid;
>   	root_uid = 0;
>
>   	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
> +
> +	TEST(shmctl(shm_id, SHM_STAT_ANY,&temp_ds));
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EINVAL)
> +			tst_brk(TCONF, "kernel doesn't support "
> +					"SHM_STAT_ANY");

> +		else
> +			tst_brk(TBROK | TTERRNO,
> +					"Current environment doesn't permit "
> +					"SHM_STAT_ANY");

> +	}
>   }
>
>   static void cleanup(void)
> --
> 2.17.1
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
