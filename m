Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234F6FA222
	for <lists+linux-ltp@lfdr.de>; Mon,  8 May 2023 10:25:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC0AE3CB576
	for <lists+linux-ltp@lfdr.de>; Mon,  8 May 2023 10:25:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E11C33C0238
 for <ltp@lists.linux.it>; Mon,  8 May 2023 10:25:17 +0200 (CEST)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com
 [216.71.158.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C8BB814002DE
 for <ltp@lists.linux.it>; Mon,  8 May 2023 10:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1683534316; x=1715070316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I4KyjoiKchs7V2iWrzzvK6eal4yXhyrVnv6CuVBDuDk=;
 b=OoTPbNqanxZZmHflui2+JcDVpM7GYudFuQVE0Oz34zpx9VCGtKBmVNEz
 x60dT+EwzPdpePDMZ6iHwhdWkB3QjDZPljbnbkOwgmtHeTJO58XVmhC98
 92cYjebknXAmneTmtleh+phBJE0IO3PrBnTJqZc2zq7v7LGF1o4bm3BMI
 4svCLZ3Nw1NJXZLIFBa3BisILGLRk6p6JRAnXsEjjznoWVQZRdBya9E1b
 JzM3JLhutvaTk1nP+elJtKUJ1CwtcYqp6+2vmiPPrhG9nE1NrFcyGVanf
 2tNZwTs08mXeJIUrOJwDA9a34a5BtsVdVeS8R7yvZ5kqU8KqVUP1UB1Yx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="83333517"
X-IronPort-AV: E=Sophos;i="5.99,258,1677510000"; d="scan'208";a="83333517"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 17:25:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fvm8kE0DtgqpUxQwz8hsGRU7i1Hr2NEaPFdy/ln5+2IaJsCOdxmb7Reazi1jSaXMfy9sc/937cJK12kvE1TiSPlihpZ+0AHeLMryJSBCTTK3nvyhwTFrhF/QkTIg8dhRcT0lN3GDUdNXZp2ym678UEWa6LNlHhjkbrleTfJrTqRYVFUmD5kelLGLs5SO59C7uLOxkMKf0qGSmYcKEygWWlpb5nB1Sw/vugf4hMfg5ynsH+lZbdcXwCkbIAE/ag5OQ9DbVzwVvUSza6qDtgmmEOlJMrqcc8hYYwP1cZuaX5HcAEDZoDdz90a5j6LQ9wBkdFXUCACUhkWEH3T9hrwEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4KyjoiKchs7V2iWrzzvK6eal4yXhyrVnv6CuVBDuDk=;
 b=H/Swv1FWR6j7S36Cm9SsIvo6uytGAcnWyXVPoBdNJ9/ctLJErqki92ftyDPv95cGSgGjz+OyQE3nAvUAZ36mvi0K9F6+udxx6ujzgNAFY7vpUwyOZsLbKaBQrJi+Is1EyN7f5PqHSJXJknOXAP9m35uc/y94rQ2OQYXJZZkO3Enfl3otzyMOIcDJRf+eTeyvQ/I48h17ySkW5iHDoCDChq44xa6pr9+cZbROoa1WtEhAqg85ARQy5mERW2G5GHFKYovrsm8boh5TuDtfhOd5sTIn9uQULjsWL2TjHcLdqGntp3uDsTFWM0eCmSklQGQTw2X5oofnBAmH2MJVx5L2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB10725.jpnprd01.prod.outlook.com (2603:1096:400:2a5::7)
 by TY3PR01MB10906.jpnprd01.prod.outlook.com (2603:1096:400:3af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 08:25:10 +0000
Received: from TYWPR01MB10725.jpnprd01.prod.outlook.com
 ([fe80::1eae:326d:abf5:e4e1]) by TYWPR01MB10725.jpnprd01.prod.outlook.com
 ([fe80::1eae:326d:abf5:e4e1%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 08:25:10 +0000
From: "Yang Xu (Fujitsu)" <xuyang2018.jy@fujitsu.com>
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [PATCH v4 2/4] syscalls/statx10: Add basic test for
 STATX_DIOALIGN on regular file
Thread-Index: AQHZaEpelwVUoZfRMk6Q/iAgJbfD1K8+Rj0AgABS04CABz+TAIAKY/oA
Date: Mon, 8 May 2023 08:25:10 +0000
Message-ID: <9b44e391-6c5d-2671-1adc-69efd6577160@fujitsu.com>
References: <20230404215918.GA1893@sol.localdomain>
 <1680759622-8738-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1680759622-8738-2-git-send-email-xuyang2018.jy@fujitsu.com>
 <20230426220654.GD58528@sol.localdomain>
 <b1f3f7ee-6f90-172c-520a-fd6ddc23363f@fujitsu.com>
 <20230501174442.GA1224@sol.localdomain>
In-Reply-To: <20230501174442.GA1224@sol.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB10725:EE_|TY3PR01MB10906:EE_
x-ms-office365-filtering-correlation-id: 3c72df0b-0021-4020-34b4-08db4f9dbce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t7PFTvQRvW0poVF2oAYIg8ObV3jSaxj72NV8D3r65BjPeDMqPCFP/bKUvgvYquu4Ccr3Vk5kmvPb4of6M0+7o2Ja6vSoawKCXlVtbS2IDyNeEQH7wtmRATeOHvW5MXaj/h67xOpyPvawSBO8LdGqM4l4G65GO49PrDDNEAXpxZ9eLLQEEx3VJPu/qj179owqJhRabvTat1iiMhuwf/mpl2AT4sJkRJ05ERZ1uFl04FiIpzpGMw8wZCOQ3KslrFzFYY4ajkTU9Y25efBYp2deSpFK70osNFr1J5YC81SzBqc6dnfGdyMvSp/mi/aYQ1r5x6S7MVJNhqa6iLw6lmEZEMhuLeC+mdEOnPgnTChtU6h/0k/Xwoht94rvlv1iADPJFOxshKrEkNg8Gorlhku0A+Ve/V/x8h6j5iiSQg585Bl5ehlUec2twCbYx2pZ2LlDs33/4e6cwMDTTBZKpoBgUSRQzYTigoLL3NYyk4x2t4mUb9vhFSuxNMzcKLQOlQeOJLSQHdvczBB4FmyeUNfmKcm1bYvLe+zc1Q9oEjOWD3U1DLuydBk7QF0y+GeC2IKujVCEHC1A93qhy3XDYd0UgIjTYWh+8VDPyEOuLIj/VwODPOQKBgTJQj9Cn5Pb+iYNxSnAsYA5ujV0U14ieBfLA42Uyiqb34yc5t/LR+RKsNE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB10725.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(1590799018)(451199021)(91956017)(31686004)(76116006)(64756008)(5660300002)(6916009)(4326008)(66446008)(478600001)(66556008)(8676002)(8936002)(66476007)(66946007)(2906002)(71200400001)(316002)(41300700001)(1580799015)(6486002)(966005)(6506007)(26005)(6512007)(186003)(82960400001)(2616005)(36756003)(83380400001)(85182001)(38070700005)(38100700002)(31696002)(86362001)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDdRQkNRYStRRERsaFc1NGNhUjgyL20zNDVGYThyaTJyZUZvZUE1UFhWckwv?=
 =?utf-8?B?enNhSmlPTzVGTlhIUm1yZnFGWGZ4bnEwd1dkU3IzUEhQZGYzNGg0TjBlRm80?=
 =?utf-8?B?VWtxZ241WVBZVmNqKzhYYnBPL3ZBUERPVzdWZTNuc2o4dHhJRXRqcnFJbys2?=
 =?utf-8?B?M3ZiOW92SVJEekE5bXJBbUdtUWoxUFhVOFJEUEFlamlIR2dzUUZmdkNpTUVq?=
 =?utf-8?B?UmxtVzBwZGFDOWpmY3U0cUl3TXBzZGhhcGZZaGp0VmxHL0tjSURTVk5odkdB?=
 =?utf-8?B?amJrNHhyNnBFMHZEeUFRaXZVYVVNMXFZM3h3ejVlN3J1M1k5VVE0WjA2cnZh?=
 =?utf-8?B?a2h4YTk2SzlBZW1JK1RuQVRmaU1QR1NHMG9WQ1YrTEpZS3E0VzdRcXBDbDEr?=
 =?utf-8?B?MkhPWm1VOE9EWitsaVNSSWx3NkxLcElqRHJJOCtlcTFCQzdHUm5Pdld3N3pa?=
 =?utf-8?B?cm80dllxUm1XNGRjcXBaaGFOUDEyZExoMTNiQXZmZUxPQ2t4Z1doa2N5aENU?=
 =?utf-8?B?aGcwMzg5NzVZSjQvVm82eDIwa1psR3RPQzh3a0p1QU1yNHpSTDhuR0lUcGZW?=
 =?utf-8?B?aHZ4SnZDbDVQQWhYcExHemhQNmU2dkhCOGpseWIrem0xampqazBtSHkwOTYx?=
 =?utf-8?B?TEFjbzZkTFkxN0h1UkhLcm9Wb3FFRzZVSWNlcjRBYkRmQWFEdXZ3LzFJdHFx?=
 =?utf-8?B?RDBLSXkrbEphT0QyU0kwc2c3NmJiS251S2lRZ2pOVkhMMTVpYVo0ZHpGa2I2?=
 =?utf-8?B?SEJIdnVhSnJFampHTzUyMVZhUGZuREpjek90NmI3VHloRTQ4enloQUN3RTkv?=
 =?utf-8?B?MjB4enMxd3VBUWhYSDAyZ0Z2c01hSzhaMzJEbVdVR2xFUnNxTUw0bzZ3aGFJ?=
 =?utf-8?B?YU4yVWs4Mk9JQklpMW5SbU5OVkZOWWhHaHR4MzNQWTlkclZnaHBNQjh2TTkx?=
 =?utf-8?B?V2Z6dnNUVFBjUFpXVVZ5WTdjcEVKeTV0OVo5ei9ZdGhJek12MXNMR1BjRGNY?=
 =?utf-8?B?ZWNnMXd0VkQzUVplSFFKL241QUFKL2cxZ0pLRGJUbmFFUUk3cFR4SXN2NkhC?=
 =?utf-8?B?Y0RoWktyaENpQUtNQjRSbXpoVDYwRUFlb1Yxa3RzTU0vSU1Nb1lmOVFDWkI0?=
 =?utf-8?B?Qjg0OThWT1pZRS9hZmRvUWlBL1hKWFFldHZTd1d0K21LREI5RkxRcUpLMGN3?=
 =?utf-8?B?WHQreE5YRU5IeXA1TW5QZlFQdFZaTXhJUHluNDZFOEVFc1RIY256Tk51Zndk?=
 =?utf-8?B?ZFNnMVZBOVNTSDVBOTBoZC9wdy9nQTBmM2tYS2QyWUh2NzgrUm9hb292L1A3?=
 =?utf-8?B?N0ZCZGsyeGdISlFNZC9ZYzlCUGh4dS9QMWlMOUFLWmducGh6QUdyMmRSM1hO?=
 =?utf-8?B?V3Izd0IyUmpBcVVPQUdjajladWhnK0JuQW96cjhoVGNHMXYyWUV0YkhDdWJG?=
 =?utf-8?B?Nm5QbTN4bHAvdndQNE50ZkRuQ2RSMVd3U2tCNzgrMEVCek9LL2VpZ2FXMzY1?=
 =?utf-8?B?TFhNZFV2UmtxcVZOVWZPblhGSEJiVkpLZzVVVDRhbWNzdjZTWml1RURuU2lF?=
 =?utf-8?B?Q2JXdTI4WVFYVWRnNTRSK1ZWRFgzVlZXUXMrUC83SkFrQ1g2Mkt4dkZKNGpB?=
 =?utf-8?B?R0xsVCtjN1g3V0ZmVTh3VFdmdUc2MGRjcEk2NXBmQ2YrMFdpRU1nMHFISjlN?=
 =?utf-8?B?QktGd2tEYWo5N09IcDkwWkxBSGthb2J6ZVJkWWNEaUtQRHBEZVo0clo5ZVpP?=
 =?utf-8?B?ZU1lZ0I0Z1hoZ1lqZzVMam9qNXoza1kxOVZKRWlxanRBSDJvWVB0MDhBZXpa?=
 =?utf-8?B?S2FMOHBENmMvQlRmL1E1UkZxMXBPVXJoZWhrSndoQkRqMXVleFFKQjZXZjlo?=
 =?utf-8?B?YmFmc0Q1NjYwOTZoM0E3MlFVbkVsc29xdkpZa3ZBZTBtZGhoR3U4WkRkV2xk?=
 =?utf-8?B?ckk4UmpsTmJtampFVWx5UTJwWFFNRVBwRmZnZEZjZ1lTZllqWVV3RDYzMUxK?=
 =?utf-8?B?ekdxd2pmMnR6dWJYeUJ5bTM3Y3lnQTdIanptRWFZUFJERHFwZmYzWHNkdU84?=
 =?utf-8?B?ZXliSzVETzhWWWNGOElSM08xbTU4N3dnam9nbU9FWnFhd0h4THNPVW5FR1FW?=
 =?utf-8?B?R2hvK3JDeENQdi9tQXU1R1pySk12eXpVMll0QUZsUmdHNnZGQWZ6aXFaemoy?=
 =?utf-8?B?NUE9PQ==?=
Content-ID: <3A5474B582007C4AB469B2C2FDDE1E09@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LeWnaOWBd5WooU438/ALjmfcSQYjRkt57frKqVuUYLTGQflsOzEBq00EVQVx0UmSi4RgDwTeAwpki45b8quwwIpQmLO0bookWj+spF7oyDE9cYGmpZ8X6q+0d5Z2FZF8IxUHPINipHhXHvKl9HpXcTUmEdRVSdmNDGCyQvOJnxBlgMOucv6DT9DwVTuefytA5zKJIIFxftx+iU1Qn6VQk4XHGQGuKJOKAadRfn2/3kT2L5likt3FYbTKo8W1Z9Oc3Em8j8TRWLL1Ag0hrVrhVlerLpy8HvCKXtZBIVurl1LmsNNr9pghRPKRFWIbQyTaOaK2ePQ988LoRLyLb9/KL72xg0NS9+Qf2k6eUUEG7DsEJydTrcyL4k537HLc8cesgpPimD/kQzBRFNE7sqpok872zLufVtyDnlNZnGRQIFVch6hTw6EP8veiBsqy6zH0ipqTTZLNcNm+wwkdhX1g4a+YXRgmSpnLGbygM4yQLa2DsC5QmtqgBMXtoGg3ylw1wdrPGBPp8viXVJfRITlN/kTr5C0A5JVAq7684Zy/fvbGadzkzNzsOov5+784lY64YOu97+zmJVXQ/mtBkpRqOFOX4NAol+89zg7mu3Wmdn6HPT2cKHp5RTkmm33564cBUUMANK9bAUDdwdkqitQ+r8oZOazE1PXQ/jD6p9ZJVs8cur2YISyj0ehF27ZgyZfYqoGcQ9KAFMul0smm9IjA/qdx7absJ++jrl5GEvtC+92hD/Gz9RO8DOP5VSs3ajf4mRBzKse8CN7RPMPCJaRmiQncRlYR4vWguegHYlqbBQ0=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10725.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c72df0b-0021-4020-34b4-08db4f9dbce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 08:25:10.0423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCPQBtjo27Xb1CoBrcwdw3s/v+HZjvzhEkwK95dzV10tTS/kO0byPQRVgS5R9IU62VWn3joyKQ09Dsq9J39qgpTyfk5cs4JipkSaL+YxN/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10906
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/4] syscalls/statx10: Add basic test for
 STATX_DIOALIGN on regular file
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

DQpvbiAgMjAyMy8wNS8wMiAxOjQ0LCBFcmljIEJpZ2dlcnMgd3JvdGU6DQo+IE9uIFRodSwgQXBy
IDI3LCAyMDIzIGF0IDAzOjAzOjIzQU0gKzAwMDAsIFlhbmcgWHUgKEZ1aml0c3UpIHdyb3RlOg0K
Pj4gb24gMjAyMy8wNC8yNyA2OjA2LCBFcmljIEJpZ2dlcnMgd3JvdGU6DQo+Pj4gT24gVGh1LCBB
cHIgMDYsIDIwMjMgYXQgMDE6NDA6MjBQTSArMDgwMCwgWWFuZyBYdSB3cm90ZToNCj4+Pj4gKyAq
IE9uIGV4dDQsIGZpbGVzIHRoYXQgdXNlIGNlcnRhaW4gZmlsZXN5c3RlbSBmZWF0dXJlcyAoZGF0
YSBqb3VybmFsaW5nLA0KPj4+PiArICogZW5jcnlwdGlvbiwgYW5kIHZlcml0eSkgZmFsbCBiYWNr
IHRvIGJ1ZmZlcmVkIEkvTy4gQnV0IGx0cCBkb2Vzbid0IHVzZSB0aGVzZQ0KPj4+PiArICogZmVh
dHVyZXMgYnkgZGVmYXVsdCwgU28gSSB0aGluayBkaW8gc2hvdWxkIG5vdCBmYWxsIGJhY2sgdG8g
YnVmZmVyZWQgSS9PLg0KPj4+DQo+Pj4gRG9lcyBMVFAgY3JlYXRlIGFuZCBtb3VudCB0aGUgZmls
ZXN5c3RlbSBpdHNlbGY/DQo+Pg0KPj4gWWVzLCBJIGhhdmUgZW5hYmxlZCBtb3VudF9kZXZpY2Ug
aW4gdHN0X3Rlc3Qgc3RydWN0LCBtb3VudF9kZXZpY2UgdXNhZ2UNCj4+IHlvdSBjYW4gc2VlIHRo
ZSBmb2xsb3dpbmcgdXJsLg0KPj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVj
dC9sdHAvd2lraS9DLVRlc3QtQVBJIzExNS10ZXN0aW5nLXdpdGgtYS1ibG9jay1kZXZpY2UNCj4+
DQo+PiBJZiB3ZSBzZXQgYmxvY2sgZGV2aWNlIHRvIExUUF9ERVYgZW52aXJvbm1lbnQsIHdlIHVz
ZSB0aGlzIGJsb2NrIGRldmljZQ0KPj4gdG8gbW91bnQuIE90aGVyd2lzZSwgdXNlIGxvb3AgZGV2
aWNlIHRvIHNpbXVhdGUgaXQuDQo+IA0KPiBHcmVhdCwgY2FuIHlvdSB1cGRhdGUgdGhlIGNvbW1l
bnQgdG8gbWFrZSBpdCBjbGVhciB0aGF0IHRoaXMgdGVzdCBjcmVhdGVzIGl0cw0KPiBvd24gZmls
ZXN5c3RlbT8NCg0KT2YgY291cnNlLg0KPiANCj4+Pg0KPj4+IElmIG5vdCwgdGhlbiBpdCB3b3Vs
ZG4ndCBoYXZlIGNvbnRyb2wgb3ZlciB0aGlzLg0KPj4+DQo+Pj4+ICsJaWYgKCEoYnVmLnN0eF9t
YXNrICYgU1RBVFhfRElPQUxJR04pKSB7DQo+Pj4+ICsJCXRzdF9yZXMoVENPTkYsICJTVEFUWF9E
SU9BTElHTiBpcyBub3Qgc3VwcG9ydGVkIHVudGlsIGxpbnV4IDYuMSIpOw0KPj4+PiArCQlyZXR1
cm47DQo+Pj4+ICsJfQ0KPj4+DQo+Pj4gIkZpbGVzeXN0ZW0gZG9lcyBub3Qgc3VwcG9ydCBTVEFU
WF9ESU9BTElHTiINCj4+DQo+PiBPSy4NCj4+Pg0KPj4+PiArDQo+Pj4+ICsjaWZkZWYgSEFWRV9T
VFJVQ1RfU1RBVFhfU1RYX0RJT19NRU1fQUxJR04NCj4+Pg0KPj4+IFRoaXMgbG9va3Mgd3Jvbmcu
ICBJZiB0aGUgc3lzdGVtIGhlYWRlcnMgYXJlIG1pc3NpbmcgdGhpcyBmaWVsZCwgdGhlbiB0aGUN
Cj4+PiBkZWZpbml0aW9uIGluIHRoZSBMVFAgc291cmNlIHRyZWUgc2hvdWxkIGJlIHVzZWQgaW5z
dGVhZC4NCj4+DQo+PiBZZXMsIHVzdWFsbHksIGlmIHN5c3RlbSBoZWFkZXJzIG1pc3MgdGhpcyBm
aWVsZCwgd2Ugc2hvdWxkIHVzZSBsdHANCj4+IGRlZmluaXRpb24gaWUgc29tZSBtYWNyby4gIEJ1
dCBoZXJlIGl0IGhhcyBhIGxpdHRsZSBkaWZmZXJlbmNlLCBpdCBpcyBhDQo+PiBtZW1iZXIgaW4g
YSBzdHJ1Y3QuDQo+Pg0KPj4gc2VlIGluY2x1ZGUvbGFwaS9zdGF0LmgNCj4+DQo+PiAjaWYgZGVm
aW5lZChIQVZFX1NUUlVDVF9TVEFUWCkNCj4+ICNpbmNsdWRlIDxzeXMvc3RhdC5oPg0KPj4gI2Vs
c2UNCj4+IHN0cnVjdCBzdGF0eCB7DQo+PiAgICAgICAgICAgLyogMHgwMCAqLw0KPj4gICAgICAg
ICAgIHVpbnQzMl90ICAgICAgICBzdHhfbWFzazsNCj4+ICAgICAgICAgICB1aW50MzJfdCAgICAg
ICAgc3R4X2Jsa3NpemU7DQo+PiAgICAgICAgICAgdWludDY0X3QgICAgICAgIHN0eF9hdHRyaWJ1
dGVzOw0KPj4gICAgICAgICAgIC8qIDB4MTAgKi8NCj4+ICAgICAgICAgICB1aW50MzJfdCAgICAg
ICAgc3R4X25saW5rOw0KPj4gICAgICAgICAgIHVpbnQzMl90ICAgICAgICBzdHhfdWlkOw0KPj4g
ICAgICAgICAgIHVpbnQzMl90ICAgICAgICBzdHhfZ2lkOw0KPj4gICAgICAgICAgIHVpbnQxNl90
ICAgICAgICBzdHhfbW9kZTsNCj4+ICAgICAgICAgICB1aW50MTZfdCAgICAgICAgX19zcGFyZTBb
MV07DQo+PiAgICAgICAgICAgLyogMHgyMCAqLw0KPj4gICAgICAgICAgIHVpbnQ2NF90ICAgICAg
ICBzdHhfaW5vOw0KPj4gICAgICAgICAgIHVpbnQ2NF90ICAgICAgICBzdHhfc2l6ZTsNCj4+ICAg
ICAgICAgICB1aW50NjRfdCAgICAgICAgc3R4X2Jsb2NrczsNCj4+ICAgICAgICAgICB1aW50NjRf
dCAgICAgICAgc3R4X2F0dHJpYnV0ZXNfbWFzazsNCj4+ICAgICAgICAgICAvKiAweDQwICovDQo+
PiAgICAgICAgICAgY29uc3Qgc3RydWN0IHN0YXR4X3RpbWVzdGFtcCAgICBzdHhfYXRpbWU7DQo+
PiAgICAgICAgICAgY29uc3Qgc3RydWN0IHN0YXR4X3RpbWVzdGFtcCAgICBzdHhfYnRpbWU7DQo+
PiAgICAgICAgICAgY29uc3Qgc3RydWN0IHN0YXR4X3RpbWVzdGFtcCAgICBzdHhfY3RpbWU7DQo+
PiAgICAgICAgICAgY29uc3Qgc3RydWN0IHN0YXR4X3RpbWVzdGFtcCAgICBzdHhfbXRpbWU7DQo+
PiAgICAgICAgICAgLyogMHg4MCAqLw0KPj4gICAgICAgICAgIHVpbnQzMl90ICAgICAgICBzdHhf
cmRldl9tYWpvcjsNCj4+ICAgICAgICAgICB1aW50MzJfdCAgICAgICAgc3R4X3JkZXZfbWlub3I7
DQo+PiAgICAgICAgICAgdWludDMyX3QgICAgICAgIHN0eF9kZXZfbWFqb3I7DQo+PiAgICAgICAg
ICAgdWludDMyX3QgICAgICAgIHN0eF9kZXZfbWlub3I7DQo+PiAgICAgICAgICAgLyogMHg5MCAq
Lw0KPj4gICAgICAgICAgIHVpbnQ2NF90ICAgICAgICBfX3NwYXJlMlsxNF07DQo+PiAgICAgICAg
ICAgLyogMHgxMDAgKi8NCj4+IH07DQo+PiAjZW5kaWYNCj4+DQo+PiB0aGUgbHRwIGRlZmluaXRp
b24gb25seSBjYW4gYmUgdXNlZCB3aGVuIDxzeXMvc3RhdC5oPiBtaXNzIHN0YXR4IHN0cnVjdA0K
Pj4gaW5zdGVhZCBvZiBzdGF0eCBzdHJ1Y3QgbWVtYmVyLiAgSXQgc2VlbXMgd2UgZG9uJ3QgaGF2
ZSBhIGJldHRlciBpZGVhLg0KPj4gT3IgZG8geW91IGhhdmUgc29tZSBpZGVhPw0KPj4NCj4+IEl0
IHNlZW1zIHdlIHRoaW5rIHRoaXMgcXVlc3Rpb24gbW9yZSBjb21wbGV4LCBpZiBzeXN0ZW0gaGVh
ZGVyIG1pc3MsDQo+PiB0aGVuIHVzZSBsdHAgZGVmaW5pdGlvbiwgdGhlbiB3ZSBjYW4gbm90IGZp
Z3VyZSBvdXQgd2hldGhlciBmYWlsIG9yIHdlDQo+PiBqdXN0IG9uIG9sZCBrZXJuZWwuICBFeGNl
cHQgd2UgYWRkIGEgbWluaW5sIGtlcm5lbCBjaGVjayBpbiAgdGhlIGJlZ2lubmluZy4NCj4+DQo+
IA0KPiBBcyBJIHNhaWQsIGlmIHRoZSBzeXN0ZW0gaGVhZGVycyBhcmUgbWlzc2luZyB0aGUgbmVl
ZGVkIGZpZWxkcywgdGhlbiBMVFAgc2hvdWxkDQo+IHVzZSBpdHMgaW4tdHJlZSBkZWZpbml0aW9u
LiAgSS5lLiwgdGhlIGluLXRyZWUgZGVmaW5pdGlvbiBzaG91bGQgb25seSBiZSB1c2VkIGlmDQo+
IEhBVkVfU1RSVUNUX1NUQVRYICYmIEhBVkVfU1RSVUNUX1NUQVRYX1NUWF9NTlRfSUQgJiYgW2Fs
bCBvdGhlciB0ZXN0ZWQgZmllbGRzXS4NCg0KWWVzLCBpdCBzaG91bGQgd29yayB3ZWxsIGJ1dCBs
dHAgaGFzIG90aGVyIG93bmVyIGhlYWRlcnModGhleSBzdGlsbCANCmluY2x1ZGUgPHN5cy9zdGF0
Lmg+KSwgc28gaXQgY2FuJ3Qgd29yayB3ZWxsDQpJIHRyeSBpdCBhcyBiZWxvdzoNCg0KKyNpZiBk
ZWZpbmVkKEhBVkVfU1RBVFgpICYmIFwNCisgICAgZGVmaW5lZChIQVZFX1NUUlVDVF9TVEFUWF9U
SU1FU1RBTVApICYmIFwNCisgICAgZGVmaW5lZChIQVZFX1NUUlVDVF9TVEFUWCkgJiYgXA0KKyAg
ICBkZWZpbmVkKEhBVkVfU1RSVUNUX1NUQVRYX1NUWF9NTlRfSUQpDQorI2luY2x1ZGUgPHN5cy9z
dGF0Lmg+DQorI2Vsc2UNCi4uLi4NCiNlbmRpZg0KDQoNCnNlZSBsdHAvaW5jbHVkZSwgbHRwIG93
bmVyIGhlYWRlciBhbHNvIHVzZXMgIDxzeXMvc3RhdC5oPih1c2Ugc3RhdCANCnN0cnVjdCBvciBz
dGF0IHN5c2NhbGwpDQpzYWZlX2ZpbGVfb3BzX2ZuLmg6MjE6I2luY2x1ZGUgPHN5cy9zdGF0Lmg+
DQpzYWZlX21hY3Jvc19mbi5oOjE5OiNpbmNsdWRlIDxzeXMvc3RhdC5oPg0KdHN0X2RldmljZS5o
OjExOiNpbmNsdWRlIDxzeXMvc3RhdC5oPg0KdHN0X3NhZmVfZmlsZV9hdC5oOjEwOiNpbmNsdWRl
IDxzeXMvc3RhdC5oPg0KdHN0X3NhZmVfbWFjcm9zLmg6MTM6I2luY2x1ZGUgPHN5cy9zdGF0Lmg+
DQoNCklmIEkgcmVtb3ZlIG1udF9pZCAgaWZkZWYgY2hlY2sgaW4gc3RhdHgwMS5jLCB0aGVuIHN0
YXR4MDEgIHdpbGwgcmVwb3J0IA0KcmVkZWZpbmUgZXJyb3IgZm9yIHN0YXR4IHN0cnVjdCBhcyBi
ZWxvdzoNCg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHN0YXR4MDEuYzozNToNCi4uLy4uLy4uLy4u
L2luY2x1ZGUvbGFwaS9zdGF0Lmg6MzA6ODogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiDigJhzdHJ1
Y3QgDQpzdGF0eF90aW1lc3RhbXDigJkNCiAgc3RydWN0IHN0YXR4X3RpbWVzdGFtcCB7DQogICAg
ICAgICBefn5+fn5+fn5+fn5+fn4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvdXNyL2luY2x1ZGUv
Yml0cy9zdGF0eC5oOjMxLA0KICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL2luY2x1ZGUvc3lz
L3N0YXQuaDo0NDYsDQogICAgICAgICAgICAgICAgICBmcm9tIC4uLy4uLy4uLy4uL2luY2x1ZGUv
dHN0X2RldmljZS5oOjExLA0KICAgICAgICAgICAgICAgICAgZnJvbSAuLi8uLi8uLi8uLi9pbmNs
dWRlL3RzdF90ZXN0Lmg6MjMsDQogICAgICAgICAgICAgICAgICBmcm9tIHN0YXR4MDEuYzozMzoN
Ci91c3IvaW5jbHVkZS9saW51eC9zdGF0Lmg6NTY6ODogbm90ZTogb3JpZ2luYWxseSBkZWZpbmVk
IGhlcmUNCiAgc3RydWN0IHN0YXR4X3RpbWVzdGFtcCB7DQogICAgICAgICBefn5+fn5+fn5+fn5+
fn4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBzdGF0eDAxLmM6MzU6DQouLi8uLi8uLi8uLi9pbmNs
dWRlL2xhcGkvc3RhdC5oOjcyOjg6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYc3RydWN0IHN0
YXR44oCZDQogIHN0cnVjdCBzdGF0eCB7DQogICAgICAgICBefn5+fg0KSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIC91c3IvaW5jbHVkZS9iaXRzL3N0YXR4Lmg6MzEsDQogICAgICAgICAgICAgICAgICBm
cm9tIC91c3IvaW5jbHVkZS9zeXMvc3RhdC5oOjQ0NiwNCiAgICAgICAgICAgICAgICAgIGZyb20g
Li4vLi4vLi4vLi4vaW5jbHVkZS90c3RfZGV2aWNlLmg6MTEsDQogICAgICAgICAgICAgICAgICBm
cm9tIC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDoyMywNCiAgICAgICAgICAgICAgICAg
IGZyb20gc3RhdHgwMS5jOjMzOg0KL3Vzci9pbmNsdWRlL2xpbnV4L3N0YXQuaDo5OTo4OiBub3Rl
OiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQ0KICBzdHJ1Y3Qgc3RhdHggew0KICAgICAgICAgXn5+
fn4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBzdGF0eDAxLmM6MzU6DQouLi8uLi8uLi8uLi9pbmNs
dWRlL2xhcGkvc3RhdC5oOjExMzoxOTogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhz
dGF0eOKAmQ0KICBzdGF0aWMgaW5saW5lIGludCBzdGF0eChpbnQgZGlyZmQsIGNvbnN0IGNoYXIg
KnBhdGhuYW1lLCB1bnNpZ25lZCBpbnQgDQpmbGFncywNCiAgICAgICAgICAgICAgICAgICAgXn5+
fn4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvdXNyL2luY2x1ZGUvYml0cy9zdGF0eC5oOjM5LA0K
ICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL2luY2x1ZGUvc3lzL3N0YXQuaDo0NDYsDQogICAg
ICAgICAgICAgICAgICBmcm9tIC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X2RldmljZS5oOjExLA0K
ICAgICAgICAgICAgICAgICAgZnJvbSAuLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF90ZXN0Lmg6MjMs
DQogICAgICAgICAgICAgICAgICBmcm9tIHN0YXR4MDEuYzozMzoNCi91c3IvaW5jbHVkZS9iaXRz
L3N0YXR4LWdlbmVyaWMuaDo1Njo1OiBub3RlOiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiANCuKA
mHN0YXR44oCZIHdhcyBoZXJlDQogIGludCBzdGF0eCAoaW50IF9fZGlyZmQsIGNvbnN0IGNoYXIg
Kl9fcmVzdHJpY3QgX19wYXRoLCBpbnQgX19mbGFncywNCiAgICAgIF5+fn5+DQpzdGF0eDAxLmM6
OTY6MjogZXJyb3I6ICNlbmRpZiB3aXRob3V0ICNpZg0KICAjZW5kaWYNCiAgIF5+fn5+DQoNCklN
TywgdG8gY2hhbmdlIGx0cCBvd25lciBoZWFkZXIgdG8gYXZvaWQgdXNlIDxzeXMvbW91bnQuaD4g
c2VlbXMgDQpkaWZmaWN1bHR5Lg0KDQoNCkJlc3QgUmVnYXJkcw0KWWFuZyBYdQ0KDQo+IA0KPj4+
PiArCVNBRkVfRklMRV9QUklOVEYoVEVTVEZJTEUsICJBQUFBIik7DQo+Pj4+ICsJZmQgPSBvcGVu
KFRFU1RGSUxFLCBPX1JEV1IgfCBPX0RJUkVDVCk7DQo+Pj4+ICsJaWYgKGZkID09IC0xICYmIGVy
cm5vID09IEVJTlZBTCkgew0KPj4+PiArCQlTQUZFX0NMT1NFKGZkKTsNCj4+Pj4gKwkJdHN0X2Jy
ayhUQ09ORiwgIlRoZSByZWd1bGFyIGZpbGUgaXMgbm90IG9uIGEgZmlsZXN5c3RlbSB0aGF0IHN1
cHBvcnQgRElPIik7DQo+Pj4+ICsJfQ0KPj4+PiArCVNBRkVfQ0xPU0UoZmQpOw0KPj4+DQo+Pj4g
VGhlIG9wZW4oKSBpcyBub3QgY2hlY2tlZCBmb3IgZXJyb3IgaW4gYWxsIGNhc2VzLg0KPj4NCj4+
IGhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGNvZGU6DQo+Pg0KPj4NCj4+IGZkID0gb3BlbihURVNU
RklMRSwgT19SRFdSIHwgT19ESVJFQ1QpOw0KPj4gaWYgKGZkID09IC0xKSB7DQo+PiAJaWYgKGVy
cm5vID09IEVJTlZBTCkNCj4+IAkJIHRzdF9icmsoVENPTkYsICJUaGUgcmVndWxhciBmaWxlIGlz
IG5vdCBvbiBhIGZpbGVzeXN0ZW0gdGhhdCBzdXBwb3J0DQo+PiBESU8iKTsNCj4+IAllbHNlDQo+
PiAJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJUaGUgcmVndWxhciBmaWxlIHdhcyBvcGVuIHdp
dGggT19SRFdSIHwNCj4+IE9fRElSRUNUIGZhaWxlZCIpOw0KPj4gfQ0KPj4gU0FGRV9DTE9TRShm
ZCk7DQo+IA0KPiBJIHRoaW5rIHRoYXQncyBva2F5Lg0KPiANCj4gLSBFcmljCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
