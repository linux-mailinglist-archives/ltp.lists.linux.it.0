Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9323A93B1
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:22:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B4FC3C4CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:22:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 649263C2DD7
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:22:47 +0200 (CEST)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9017E600C2B
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1623828166; x=1655364166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NpeReV/IB7y4nTUANSNma+Bk/RO3Y8JfvP9DM5Up3D0=;
 b=LKZJXzHZXTqSlV3S/JoPQmVC7amrQNuvOvNQGJdDvi3nPIAxWWPgBeIn
 qul7yyQxRIJx4gdzGTSpP+ibwy4OAMuntnYxRit1K9K9sYWtEDiJrdlO/
 mRY3hfVFmdEfuoZUTyhG/T2ep0ySZeERzE20VlWmUw4TUX0VpJTyDL/6G
 ZHIXoLygbokVrTBMGanNwnUC3W21apEfio+xgNkKvr4gKuEH0/L5gCqGU
 w9moZuftRPQI1QICcPBmrmtgjZymUAt1t2Onka8yiUv4cMbqrPYiwS6LZ
 UMatkD3bACtW7bjcZZvTZKXACyKK30GOaMReoC4XrOkFoV1257kMA5/gX w==;
IronPort-SDR: Jz8IyjPcZzE+ZbzDHAg8pihvwooz+CeaLtqV/QoWpheed3FeExoXeHDdCoBsWBMgAz+Kq6ZULd
 VBX+iFGT3yliJpK9wuwbwXVPQcr1OU/aXkmwM+zknoTOi3X+TwFXrDuJrjoFp2aMmEz/+wmWmC
 cLDBLU6RvUN575505la8SQpj7Q1QpIn52r5RvEuMfb8vfkSTHJVs+7ai93zlr4g+fWj4RqKQ1o
 /X5U1EBOqjxNrDxtDVRQuO+bJBHtM7vQzyNSyy606aH9LZZfvD9JJkd9lwP5uhvcVKnTEunxUH
 W/0=
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="33315743"
X-IronPort-AV: E=Sophos;i="5.83,277,1616425200"; d="scan'208";a="33315743"
Received: from mail-pu1apc01lp2052.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 16:22:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhG6GNujXd0hWK6+X0QHH5kyX8dRbp2M/qBvJTIil46Gj5sex44ImvDzJUF+Z1t8VjTm30v4fxi0HwcmJ5UBIIc73NOok1yBD2OHFexNuKdHJHGVA6RtVqK7iZ4Ou2HvpwyZn9ezvv+i+ZWNWFcrbmcBeJscVQ4wPvQsSwUOXJdth1mq0tqc5FjQHYpCoQOkQOcYcRTlHnTNY/gE+eIP6YI+SA40MNy9IaXaZWXfCSiaUblBlssGxni6VH1wPEnMH54fMa6I4yt/pgws3QVZiaQURmEeN98kgQoimbPto0naDM9d53JPoPiokhrAeeDxvRHGZPtiH9dF6Vijz3TnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpeReV/IB7y4nTUANSNma+Bk/RO3Y8JfvP9DM5Up3D0=;
 b=UzMM+xxS87CSt1rCmoAmIo7jEOMC+CEpJEOz7mjzIPktqlRHgZfcOTVcYtL2LLzXjGg4cuSenTf54Hd+8noXSc1KiubeneXRTitbcMbxvmb72dQ9KwoWRkyYwB0ejjubK1XZVC88rpXxIiGt5hddy61tVRV6cYI5zEaMMBnfnlD4/iHVXzzojtqtk17vFjhQkul8OjV7f8VBnjqPHLcf4ut647MmFBk/r9iSah7mFZf+4JF6dMKjV6ek3AuYKZU+GMXw68Cj0CFVd1YalYJyOTF7zclGh20DlD0RZ2tZPkMb8q4Z+3bh8cHMuvNmTJyw0+cgEqEDoSP0Cb+LWt6zXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpeReV/IB7y4nTUANSNma+Bk/RO3Y8JfvP9DM5Up3D0=;
 b=JZeoqs18mopoWWRq8pyFo04dAT2jNC5pWwFOM1GwPj9b4sCEFc6WPyzfy3qRPJtQSuiha9N3Bz5n2gCr+w96LtwxaU/f1z/d5W/cjIG3t8cgKrgDF8g88GhnxyWCCUJpJyfhK2UicV1kz98+Yi7As+lsVp+4o/HJHJFpQNhtZNw=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4362.jpnprd01.prod.outlook.com (2603:1096:404:110::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 07:22:40 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.016; Wed, 16 Jun 2021
 07:22:40 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
Thread-Index: AQHXWF0GNZS5PAFZm0O61ADyeJSRTKsWSrGAgAAFd4A=
Date: Wed, 16 Jun 2021 07:22:40 +0000
Message-ID: <60C9A6D7.2080102@fujitsu.com>
References: <YKzX7FPWGGROn6kR@pevik>
 <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YMmiQfWgvqtCzOmg@pevik>
In-Reply-To: <YMmiQfWgvqtCzOmg@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbde9f60-dbb0-453b-e1c8-08d9309786af
x-ms-traffictypediagnostic: TY2PR01MB4362:
x-microsoft-antispam-prvs: <TY2PR01MB43628022577ECE14B4776D7AFD0F9@TY2PR01MB4362.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wyI/f5/UKBcNSzSO70AyqyPKnIrMz80cjZibyApCApi64/FbconTR6ciQ9H3XTZ479uErplsa0zFBRRFsj7HHL7EQX0kMCCgaq2Zmk/IPKUI50Wk9DT2nHtmbJncm1QYNqtrh48gSZPxuyfLZg6fvwyaUlpcOl+NklQJ38SwBa+dP4Eqao2XDzHGLREuAdlQZU7pkeicT0WN3qYvich957uSK5mLzm8lGTKTERI910d0JIlRY1CAgbtDOL0ZCfGX8qsDc8JyBLbvwAcGY+9hcY2PjQKXCZM5Ry+CvVtFXlugy+iLaojj0FPST12xD6RgK8UrObmRNTlK2krucbmBNOnf3dme+/e26YrzZDgnZ3LmWWY2+qs8wYdJeYp877ZYmr2T4vvkTHUoGrjad9/QlAXVtsSVWAjgn5Brs7HFnnkJEOXzi/mbEkMqv0NfePlwgGea6ST5gVXrswvOrgU2vB7jsMyxNCddUnVU/4NDNXTv/utZ8cmjrY3NdIRy5d1MaGIu+59w0GX4rmVRbhvBGtT/WIIfV2NDFnxoJ+9KHcS66zz3MjWaQzO3BnA0W01BQ+HF3YqZ74wqaKlyxs9ezOwO5jTFyBzypm+vTyWBMpUQU8Yl9FcVG3DW/oUddPctKl2+yJrsqvvecQ8EM5CeMqh5cnTNvRPIsiw3JYi3dSQJxI8ttYFqJb6ffaaPhn73JKjquFcRoEqVkGXBTzt3PQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(6512007)(66446008)(66476007)(66556008)(86362001)(2616005)(64756008)(85182001)(8936002)(76116006)(83380400001)(91956017)(8676002)(54906003)(66946007)(4326008)(316002)(6486002)(6506007)(478600001)(6916009)(38100700002)(5660300002)(122000001)(36756003)(87266011)(186003)(4744005)(966005)(26005)(33656002)(71200400001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RDRqYXNUNU1qejFhWkloWjJTc3kyU3c1Vkp4TjFoRHFmbDkyc1pIazY5akoy?=
 =?gb2312?B?QVFidWdvalg5UW5oMEd5OFMrY1B4UHFBb0J1TFR5clBWcnUwNjlvM0huZUc5?=
 =?gb2312?B?L1NKeXFDUjBjUThsenZsU2Yxek52QkRaQzVQa0NkZ0RUYm5uSlRaNGNzQmYr?=
 =?gb2312?B?TXM1V3VtVjBtN0dhTVlscUxpcTZIK3FkcFM0OGRRa0NSTzdzTnVRbFBpMXoz?=
 =?gb2312?B?M091Zml0bmVTRVhOa3g3SVJOZ1pWR3dVeWJONVk5ZzdtdGcyVlJUTnpIQmFM?=
 =?gb2312?B?WE1RZEZkOC91WUhmajVvRlprU0tGWWI4UG8zRGlQSUJaNXpVWmdCZ3NzUlds?=
 =?gb2312?B?V3BVdFFOT3B2Q0QzeXlFOGtaREplcEgvb3IxUE1TNVNHOGNuMlh5M3RaenRE?=
 =?gb2312?B?OXoyNS9qS3d6Vk1vRVRVeTJmRmRPcVN5enIxRXRQVmc2Q1poYkJUYXhYU2Zn?=
 =?gb2312?B?Yks1MkRnejlTU3lpYWFud1lJTzN0MHV6UkxWUEtQQUlkUkpBazFodmRkR0JS?=
 =?gb2312?B?MDFNV0p3YkFERllDQTlIOU1xcHkxaDMrOTByYkdVcEg3eUxWOXVZem9YRFlD?=
 =?gb2312?B?WUwwRGphczNNZGRhSlE5M2VWVDV4UVIrSUdLL1RiaTMwWHhQOEpUTjVhTlJi?=
 =?gb2312?B?T2FWd2xrQ0JIUXoyLzdEQUNhY1BUdXBMZUROZXBQeUNHV3hkaHVZNDJ5OXhm?=
 =?gb2312?B?V2J5UUtLS3NpbDQyQjMxSERVVjhYcWx3Uy9sQjBUd20rSSt0TXk2MEE0TVZz?=
 =?gb2312?B?UEhXZjFvUWxrS1dCRXJEU3dBZEZpbE9YeGQyd2MvUkFndm5qaW9HbnpCRTRT?=
 =?gb2312?B?MGMwTnVHY0ltRVp0aHBNVmVxQzBEL1JLVXA4M0lIbW1BZW0xcEZsMEZENFha?=
 =?gb2312?B?U1VZcWtYSXFJQ0JYaDYyZHo5NUE4VFJHSm5ybFdZU0tkazhzYWk1WDRyVWE4?=
 =?gb2312?B?cHkwY0RXc1V2UmVIQkwzdTVmN0tmekI3dm8zT0QzRzVZNUhPalp5cmtydTVX?=
 =?gb2312?B?T2RTaUlBK0FDK0YzMkFwNkdQaGZBRTVjREVrbkM5ZjMyYkRxc3h4UnBsRUhF?=
 =?gb2312?B?cndvQnJwL3V4ZjBxa1FnTjdwWWlaR25DTUVROWgxNlhLSDZCcnZpSjEyb3dr?=
 =?gb2312?B?VDZsaWJxbjNaaXAxTTJHU1prUHV4V2hwQktQcGtLMGhsUGQ1R3RVRjY5T0xK?=
 =?gb2312?B?aTkrUWc0ODRKZDhaUno4OThrU1hla1h2NEdCWEs5cTZPN3lsb3dVd0JHRXlu?=
 =?gb2312?B?K2FRNW41Skh2SVY1U3htdlpWcHd1blBvZHJYU1hRa29XckRCeUV2WkZ4aU1o?=
 =?gb2312?B?TlBsbXpUeUdhWGJpdzZVTGJ0UUJ2MWFZVW5wbVFPMkhOa3hTN3duY2FpRjNj?=
 =?gb2312?B?MytQem4vZkpwZUFOZThPazRGd0JLWHdzZXlkamlpUTlIWGpDSEZHL3FaMVVX?=
 =?gb2312?B?Uk10TlBzenM4Z1czRjYzdnZMaTRubXhPWHdsTkxpM3ZIWUNuamhiaVZ1ZnpD?=
 =?gb2312?B?OXZmek56SVJ5bFRVZUtRakJJN1hjZkMrSFdFVHlCRFhaT2JaTWNCbEhmUTAy?=
 =?gb2312?B?aFlheDBlRmRZQk95RlVwZStmTVJydERQS0FEN3FOVGl3LzdLa25FQnBRZmhh?=
 =?gb2312?B?RVloSGdGNTRjNGYzM3VuNlY4RVo1VS9WSFpFZjVJOHlMYkRvd2I4b1RLY013?=
 =?gb2312?B?WDlKc2NycnFPVk1YOGdsOWI5OGJ5a25sVEQyd2tESlNWN0kzYW5aY2hsajY4?=
 =?gb2312?B?NEpwZWYxVEFOMk93K3N4UHdaemJ5Tm5JM3dQZzRwdG8weXZ1Qmo2L2tMN0My?=
 =?gb2312?B?Q2NnWWJBTkU2YzREd0Z5UT09?=
x-ms-exchange-transport-forked: True
Content-ID: <DEAA7671D065C843BD6E3470DDDB662C@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbde9f60-dbb0-453b-e1c8-08d9309786af
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 07:22:40.6986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYSr10qS8Mpn5AeDJvA/yQkVg/JULPYemgafuNH+t6/5zqI0Xs0G8yUQyw8k4XxGgdZNHTbcyh+Lkv6o17aqtCoEKwxLgPnkpSewpPn8kkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4362
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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

Hi Petr
> Hi Xu,
>
>> +++ b/testcases/kernel/syscalls/mallinfo2/Makefile
> ...
>> +
>> +top_srcdir		?= ../../../..
>> +
>> +include $(top_srcdir)/include/mk/testcases.mk
>> +
>> +CFLAGS += -I../mallinfo
> Also this needs to be
> CFLAGS += -I$(abs_srcdir)/../mallinfo
>
You are right. It will fail when out of tree.
> otherwise out of tree builds fail:
> https://github.com/pevik/ltp/actions/runs/941820122
>
> BTW Cyril also suggested recently to drop out of tree support, because build
> system dependencies are broken and fixing it would be much easier when
> supporting only in tree build.
On my test envrionment, I never use out of tree build. So I am fine with 
removing it.
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
