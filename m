Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF293FE715
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 03:17:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 592713C4C1F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 03:17:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 219703C2953
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 03:17:13 +0200 (CEST)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A412E600D7D
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 03:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630545432; x=1662081432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ibNaQRlet+g0uhT3hYGKKL6XmeM7oQhn+TYJb5roT7Y=;
 b=iOXT5m60OMDW6RwduaKGefyl342hxY7COH8o/krWX4cgktT2zBga/ae0
 Y3iVotxZXsRikO463cOzfZH90+oUf7YoVo+1cLDB9aeqXz/5tlR/UF9Mz
 DMLIRck0hECCFX/13qBcO6MHeSV9EixnJwGVuUvxfeqOqYv9kaIXg22Q0
 MDlINnv6LPaN6xfzLd42cGWZaRVUoUyLh6/uSikrxfSpd758uwfaQ0luO
 qEODB3fhGpcaF7dwPnjB3qPm9D6YZAGQKfw/RZbHZqDu08NcjFLcfbYqx
 YRYl3So7swYNP0LrkrrcvLV1qZpoCTlAYRQpZU2PDKlRyOjABUTDRkag/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="38397308"
X-IronPort-AV: E=Sophos;i="5.84,370,1620658800"; d="scan'208";a="38397308"
Received: from mail-hk2apc01lp2051.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 10:17:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTaFtHMN39Lq3Ec0+INVQVDC3EdBg2rz1HWJW5IJ8mfhy8joGyax4KuCogFj/0VflbKZe8LHWQ3JnsMVaBzJi9Vco9hZ669srG6FeyVhp2ED8KFNmRaeBn5O8J55YGbLsHsaXJB+pm5+WaMD9Abp7n9VLxqbGRmCq74ip9/e7bLZTJ0ucWR3G36kFNQAmVyvm3JU/4WcrZIN9PKqCpojOff/Ly3RRJW0XRYIKP8xbIprFA6hWq3oKtxca6am69T5O8mR91kQi4sras9Rw8NOObX6qnvYjokPSjzz7w5wSY1tTXQr/e9PxlY48B83NzWxunXVKrmqK0UxS0n53Sdwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibNaQRlet+g0uhT3hYGKKL6XmeM7oQhn+TYJb5roT7Y=;
 b=kom0xIBG/nhmAunUXPsbpzybLBiMP5eEcXgQNg/lgbJKb6mMcGHEQq/h9x3NTIKHdZ8I5qddUtmGzcu7b89akkVghePi25lBxzOJLL06wohXkKFNsfjBRUnG8O5ZPswmP+tCTEwirpxDPfqEzN5BQQ8yNj2gtMbhuIx/zPFRiQRhR6IqSao0bEuRSG+5JYthHXXeJe/iIbhMhMNonvhxwLCKCI7s+hWHxvAi/EXVxUBVUimbvIE0V1quOfQmmZFLd7V4ruy/mTNtlNKUTkCwMX2Q9eFQ1Aoxp1GR2Fg3tsGEHRQd1+Ty6oIldPoILQwMqMrzl1WBtm4bplNl7yt/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibNaQRlet+g0uhT3hYGKKL6XmeM7oQhn+TYJb5roT7Y=;
 b=Sq8ySC1Wbe14I69ze7dj7kP13NZKoxcTJ2ozSWAtBBcbrBlhkLjvtKIz67bxseV9+sBquFQ6OfH4w+IxUIOy4ckw0wNc/OLaz4nOsKWxQjwdrGWA7txFsqv9lvVj5M/ugg0vkeuhwXFmBuQPQAoUzLU1jlx0gERJbYsCGfnYwq0=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2012.jpnprd01.prod.outlook.com (2603:1096:404:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 2 Sep
 2021 01:17:05 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::783d:cf1b:a4b9:5791]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::783d:cf1b:a4b9:5791%6]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 01:17:05 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/pread01: Convert to new API
Thread-Index: AQHXlOH/7FI+SzC6FEW71EcnBacv4KuPS8YAgAC6+oA=
Date: Thu, 2 Sep 2021 01:17:04 +0000
Message-ID: <61302619.2020203@fujitsu.com>
References: <1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com>
 <YS+JQLNhte4E3jxM@pevik>
In-Reply-To: <YS+JQLNhte4E3jxM@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 619350ac-fbf3-48da-96cd-08d96daf6040
x-ms-traffictypediagnostic: TY2PR01MB2012:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB20124A50C5889C8106CB3BFDFDCE9@TY2PR01MB2012.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rXdsaBAbvTRGfgBnvq0Cc1aQJJLI7GGmooOyqY6dnuwKocHT/sLg+JmXVLqflEZYtyNT6Bfck0RN/cGWr2DZx2spYDuRcorV/7edFXcyVzkk6txQRDP28XMkfYjA4WkHbMa6neNO+ljuIFYTWZ0uQFOMLVuSGiOk2azjSrDXuodQiJXsb/nTNAl1PYHbOAxoe6ub3GiWWqj2HEWIne4tWMOIPU5FjobwRVeVEYZWvl1gfwurNtY6NqPqGbbmVNQqGL98W1wXGk3tSKhbErd+/FA9OcPfvPmA8aopd8CAw8iGz7wDEh0Xfpr/EFi4BomEJ7q0qME0DuFAXLqWnNB6HHKUK5lHfdp1kA13/BP4RUV8jv+Zbttv4FWTF0+moBoPGF83lpILNvl+WlqOKKfO0tZDIQ/pKw3JvcDLFESbpWrDpuUe2dXZ6TXyXoxMp9dbrShj9BC9sXIHD8K1JsVSz/g/p7NwPVfVNBdXYA1YmvcJ1U+Uvo+CJOBBlnAB4pp92K0oABcbi/s+NUOQEaulLCk9b65FbMn+4sFsBDxY572L3XgwurHMzvHSux08FNpbNnTS5UtXzseqO7SxL6HVnpzZQG6H1CuXIzNmBUrakLK8auqAv7f0MnASYlaqboAYI+ks8Yl03Ah4nLEyRNYpTadNQ4b5IQk0N5TeGdQb2yxCb9QhIQ6S/QsFyEHPdIMEi0BlWzZmQz+Nt/s7DE5J75u66PP4b+tfh1JnECKrSSg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(6506007)(2906002)(122000001)(316002)(2616005)(71200400001)(478600001)(5660300002)(66476007)(83380400001)(66946007)(4326008)(8936002)(76116006)(85182001)(186003)(6916009)(38070700005)(87266011)(91956017)(6486002)(6512007)(38100700002)(26005)(86362001)(66556008)(36756003)(8676002)(66446008)(64756008)(54906003)(62816006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bHA2djRub1NBRzZGcm1pS3owdzd6T1BEVzAvZjNzRVZBVmZhOFlRUkhKUXh0?=
 =?gb2312?B?Z3ljZ25ObXg3SnJNQ2N3aUVlMkxhWFZFbmI2S1I0VWdXL0U2ZG55aEV2WG5I?=
 =?gb2312?B?SXp3VWZDcHdJSGpwdG1yQk1jTC96QXM3VllIdnFJMUR2OUtMOEVybVF4NXZP?=
 =?gb2312?B?bU45WkNlTzFabUpRS2NFaXdOQWxXSEV0VlN6LzUwRExpa0tRVXRkQWZ0TmtT?=
 =?gb2312?B?cFlJbG5ad3lzL3k3MFVkRE8ycG83TnNuaFFvS1lHdTlRa2poVzYzYURIamp4?=
 =?gb2312?B?R1YrcVpoZWlFQ1BxR3ZZUTBKK2FKMEVNNEpIaGVMWGFKa2JCQ3NSdjV2TWVI?=
 =?gb2312?B?WGxxK3VEeHZ0a1ViWkpnK3hEOXk5WjdSK04rS2JzY1FDc0NqdXAyZGw2RmFo?=
 =?gb2312?B?Qlg1b1VJSm15REJKOVIzQmNjWXZqR2M1Z21Ua1lkR1VINDh2WnhFS1RlRTlu?=
 =?gb2312?B?Z3crOHNnUGgvYndpQVdGUzBaR1BzN2dHcXkwQ1dHdHU4NmRmWlNTUk5NQnFa?=
 =?gb2312?B?QkpMRi9ZdW5MOENDYlVpRkt3VHNHcXBuaXJidVROMHRjdjJSTzUzYjY3RHRU?=
 =?gb2312?B?VnBTYTN2d0dQNTg4ZXdNTFBWQmtSdm50Um9vekt1U0RnK3VMR3MvYmRSdjZS?=
 =?gb2312?B?SHNiY294OG9IZjRWRjBSSFZPdU9QSjNCUDhIZXgxc2pqb1RpK3FXTzI4cXhQ?=
 =?gb2312?B?L203RXdBQlFqRDI4RCt4K3gwNW1qSWhKUlc2UENLTmJqNWhPOWNzV01raXZu?=
 =?gb2312?B?NEc5N3dJdzZlVm1WQVZhRkJIUk1NdktSQ0YxaExuOTUwc21qUlMrUEhoS0Y1?=
 =?gb2312?B?UVNXdGhCUCtVQnFiekxjQkFSQzcvS2pkYitWclFwYS9Pa1NheUx1TmFJV0dz?=
 =?gb2312?B?am82RFpsZnVlTWU2bzFkRWRKZTRSSlZUOWpJRmRrM29DbzJBbHZrNXF4ZG1y?=
 =?gb2312?B?aHJ3dFdnYXZZVTVwVllrbFg1WEhOdStFaFBlcVl1TW84aTY1VE9EcUliUFdz?=
 =?gb2312?B?TDVUeldDVmRHeTExQ0JEN1lqNHlmcDNuSFdPcTFRZzc3SmNUa0k5M3N5Tm1W?=
 =?gb2312?B?a3BQM2ZpeVZhMmVGM1VNWUo1N1JvSmVKa01ZbXkrbEp0KzU4Y29zakxUVHFx?=
 =?gb2312?B?MzF3VlZZMFFWeW1wNjA2bFJvdmF0ZU1mcWtwTFNOQ2tFSnpobFg4bm1MM0lp?=
 =?gb2312?B?dm1uNjhBaTRaMHhlYUlYaWVRMHE5clNaZWszbVo2am83ak1OTjRJMkgrYWlo?=
 =?gb2312?B?am1OL3YzTDh0aXlyaTREVlhWMDB5dTZGaWk4WUgxWWppeG1OWHRDSFlkYy8y?=
 =?gb2312?B?ZXpZSERweUg0S0tFajhISzd3SDlMZFBvNlJ3bTlKVDhua3JVRnM0ZGxwMHJG?=
 =?gb2312?B?WmxQRnNXV01oNS9ZN1J6cFI5SzRlMzFOVWlaWXY5VSszMFVlV0EyVUVVQ2dr?=
 =?gb2312?B?Ri9vV01RaVZtWEl4eVdCUWNlcVRuaU95Qm1McnIzOWZpSzJmamlzOHVqOGZ2?=
 =?gb2312?B?aHc4YU03VUU3Vnd1NTRLMXBpSWNRazNMOVFjTzRrMnFhRTVLZmZ2UG9TTlB4?=
 =?gb2312?B?S3dPNUNFNTVDakdLVUkxRU9FRHRWVTlKeHJGdjh6bWVrL0pQQy9UUTc0U09U?=
 =?gb2312?B?TS8vQlI0dGdTZUlGcy9KRHpSdjFMTmJNN3daZE1XSmFQWmdOdHRrR3V6YWJH?=
 =?gb2312?B?Tmt0SmhRNy9WSjlwbGdFb05BTlU5S293Z2RhK1NBdVZ5U2hTZTFBYmpaQ21B?=
 =?gb2312?B?NGVHampEcHNKODlneG9rSnViQ1l3UHovTEJMYVB1RXFBSHJSYWMxc1lQVVha?=
 =?gb2312?B?K2tNQjJ3Mys4dnp6aGorUT09?=
Content-ID: <2442A00B9B75B346B5B97832C0154CB9@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619350ac-fbf3-48da-96cd-08d96daf6040
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 01:17:05.0259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDYqxuVpDVPbuzZBupwu9D4cOSXIzkIV+TTQm0PsT11iLR6xhT9vg2F7P5ArWIQJUKc63k6v4SBJ8xg40RgsR1uHA43nw+Mah9DZh1u/A00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2012
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pread01: Convert to new API
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
> Hi Dai,
>
>> diff --git a/testcases/kernel/syscalls/pwrite/pwrite01.c b/testcases/kernel/syscalls/pwrite/pwrite01.c
> ...
>> -/*
>> - * Test Name: pwrite01
>> +/*\
>> + * [Description]
>>    *
>> - * Test Description:
>>    *  Verify the functionality of pwrite() by writing known data using pwrite()
>>    *  to the file at various specified offsets and later read from the file from
>>    *  various specified offsets, comparing the data written aganist the data
>>    *  read using read().
>
> You kept 2 spaces between * and text. That'll lead in docparse formatting (which
> uses markdown) to formatted as code, which is wrong. It must be without space:
>
> /*\
>   * [Description]
>   *
>   * Verify the functionality of pwrite() by writing known data using pwrite()
>   * to the file at various specified offsets and later read from the file from
>   * various specified offsets, comparing the data written aganist the data
>   * read using read().
>   */
>
> Again, I have already prepared fixes, just wait for others to review.
In fact, I have reviewed these patches in internal before Dan sent these 
patches to ltp. So you can add my Reviewed-by tag for her pread and 
pwrite patches.

Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>

Best Regards
Yang Xu
>
> Kind regards,
> Petr
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
