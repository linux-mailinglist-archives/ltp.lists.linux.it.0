Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8FF76B269
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Aug 2023 12:54:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46CA13CDB73
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Aug 2023 12:54:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5078E3CDB24
 for <ltp@lists.linux.it>; Tue,  1 Aug 2023 12:54:02 +0200 (CEST)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 309D31A00F10
 for <ltp@lists.linux.it>; Tue,  1 Aug 2023 12:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1690887242; x=1722423242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=1WgaKP4Z5W8iu/fj9FBGCJA4xhmLqBr5mbvd9ystxIw=;
 b=vYSqVZCaLGWcsKWMDDNY87lrnnHPKNftITXySgrZ154JHaClg1naAC8E
 mCF08xb6nzsL+zpwtVvHQ21nzwxqT5s7a+w/BsUmWrPuDd+Ye0DRhUFmF
 jaB2dqmfp6bupWIdQeeyz1XPEf+jCcXW1QW+1iT5T4DKG0Jnfg3o5aQC1
 gDrn6lf5vGtDPLCtng7XLOEZRYG6K/P+2GtDQofCttI/4+HI8RhrvxxMm
 TVpqu2WTIQtX0VQTc/lxF0VbIvHlWG+nCC2CepKPO6KCgtr01bar1snan
 3xXvZ497j21FmHlrRIw6XUscon2PPSmDFsK+GqREvKh3hI2VWCfXDE/rq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="2281769"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; d="scan'208,217";a="2281769"
Received: from mail-os0jpn01lp2109.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.109])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 19:53:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjcAQ5elRyy9mqiTTqU4RaQQcEEovXMPWg3L4DCjStdydwMK7ar1aeHASeMvk9WoqBIceGJQ/bGqbc8SJ/m1gzWZbqDfO6FcqvQtqyRHnwQrc6W8G3JeRBMW8uNMvRkUC/8N85W6Oebpf4nxWIOyeqanmPOsiWYOgQrpTVIXEE39Kt5TDLTodrPn6WCamvhpIJXelE3SIyxaHMYpNbmkm/bgy4yvV3yNj9CQo6lJPGIVgR7WoFxLf20hoip+e7xDLqc+vhi3kgFUEetYAtzULhXYsI96meQXK9f536MfK2+ZnsG+voE4+dhMXAS8BtrloNVmA7VM4Bj4OG8pyzDoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WgaKP4Z5W8iu/fj9FBGCJA4xhmLqBr5mbvd9ystxIw=;
 b=QzY6ZRCmF1kfdM/I6uTR1alIUVIiZ6nz6BNsOjh8rbF32tGDvcRzkpLVonfRJKLiFn/SFkUHhQecHdgNQFz+paKNHo5APl5VanN0ubCHkq+e1uDLYCKk7PpMDK1v4LaBYlSoZSzq4cJq3VKhJYKqBfU4rTAWHPP/jfh+QoqTF/Nke3MIiK+LQlbw+ELP86bfL+FmmdQu9ZklsuSVk/RrQJA4OpoyOvIK5i0hgIz1bTKUk5G8Sit4h7q+MokVwkaTgvx0xhOL/PUX/4WFBZPa3M8fHR6uveUIWyU4IUApEnrSWntsgwO+s8o0WspWJIme8hEKiRcOGxxanvmIhp+fTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB10712.jpnprd01.prod.outlook.com (2603:1096:400:294::9)
 by OSZPR01MB8082.jpnprd01.prod.outlook.com (2603:1096:604:167::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 10:53:55 +0000
Received: from TYCPR01MB10712.jpnprd01.prod.outlook.com
 ([fe80::4362:cc0f:5d7e:dba]) by TYCPR01MB10712.jpnprd01.prod.outlook.com
 ([fe80::4362:cc0f:5d7e:dba%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 10:53:54 +0000
From: "Yang Xu (Fujitsu)" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH 3/3] syscalls/getgroups03: Convert to new API
Thread-Index: AQHZuifALQWV0r4N0EKU63haVbf4f6/MEcmAgAlG0gA=
Date: Tue, 1 Aug 2023 10:53:54 +0000
Message-ID: <678b168f-c1ae-b67f-2110-7442497d2056@fujitsu.com>
References: <1689760756-865-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1689760756-865-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <ZMEcGyqDgzIe0vPs@yuki>
In-Reply-To: <ZMEcGyqDgzIe0vPs@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB10712:EE_|OSZPR01MB8082:EE_
x-ms-office365-filtering-correlation-id: d26ce697-c762-4948-b371-08db927d9987
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9roq8VJ0cmP1OHKSFfZlyHbQpr9syaRbEMa7g51NI6zbRvS92eyG97M0wYRGePLuJ0TVk6955z2ED4IzHULNXoLIKwhRosvRmddJXeOb9m2h3ahIk+R98Mgxvsw6KdNd/O0Lw7ZxjVUiXwjboMk7n9ebNuW52ZwUKEMdHGijoSVKefcas5GX8cMy0qj18M8bFhYsF3tdEYamsyfE1sEwzckCA3o5uMOR7C7NMzIrcRVvkC08nwrWZJvb9TLBZxYVp7r/PAaSXjVLQmjW0ZQuJfwSEfVdbN15Gey802/QlMvtFMU6ogQL7l5JLx726/AuXQbT5VodfEHT9RAkrKcPWe2ryV+2BTL4pQRgtqix8Lj/fW7ag6PRifI8yF7FBEJHRfCGd+qFImWMknxqqUtkBWvoclfvYdSmJ5JBbq0NS04DvMvahzqAmdiSvENEUOOK0hSqkS1x9LSv3FdCHdgug1DXwK3Q5Ms42daIoe79DzpkQs3rfTOf5j0IHVi7PhsPSjcug/89o4W5MBgQLr7P/3FF3dnRJjtjtYMf34IHdG/uYIbsdpimIhaUsgBIG9B4iM8u5+a6+XHD859s5Y0SJTCq+UbNleaOsmRc0OB1DmY7oLpqKjUV4Mbk4Jn7uf7ADjxA1qIFI4h+e4Wooxc2vN6ls3XX14w2e2HjjYtH0nYk6yIGJgoNDo14P5ZuZiAZLboPJbnbQw/u+vcG3MLNsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10712.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(1590799018)(451199021)(4326008)(66446008)(66556008)(91956017)(41300700001)(5660300002)(8676002)(6916009)(76116006)(66946007)(8936002)(31686004)(82960400001)(122000001)(66476007)(478600001)(1580799015)(316002)(64756008)(2906002)(86362001)(6512007)(71200400001)(6486002)(38070700005)(83380400001)(6506007)(26005)(31696002)(85182001)(38100700002)(36756003)(186003)(2616005)(2004002)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2lMMERMd3kyVTZuMkZCSGdLT3FxSCsrb1VLbGFxaDRvUzAyTm9UdGwwazMr?=
 =?utf-8?B?Y0srSjBIc243ZXVzeFlnaEd0Z3N5NW5oSWdEbk53Y0tQb05zN08wK1VibmIv?=
 =?utf-8?B?QzBHQTZLUU5wRURUMURaR1VRS0xWbVRwYTJ6eHVzNGJKSm9ZYnhLNzdOLzFh?=
 =?utf-8?B?Snl1NEU0VkUxTkFXb0FNd3czbGJCcnVMbDh4ZE5OajE4UktjYVIxcldiWWhi?=
 =?utf-8?B?VzRSU3FLdWN1bGZJS21lYWR2cHVVbGRUSkFGSnI4R280ZUJ5UnFjZjU5ZjJH?=
 =?utf-8?B?Q0ZSZFlsbWxvRG93SnRoekNWLzRKQXUrZTRjNnZTYkVUZktKOEZKaXdyRW53?=
 =?utf-8?B?NU9BRHhuTnptTFUrUTMxTHFsSmtUdmVXZkdPLzZKK2ZubFZmN3NhVEx0OUdL?=
 =?utf-8?B?cmNneDVwUzRKdWtIWnQzUForczVickY5cXlpSThZS2pnZEhUZ0tZQlBsTFdI?=
 =?utf-8?B?WkFNOWtXSXY2VTQ4MnI3ckJSRTA3clZ5b0Q4VEttOHRtOUZxRjdUTTdEc0pV?=
 =?utf-8?B?UVJEZGhyR0M4ekxwTUZPeVZ1UWpScjdNMTZneUZBaS9YVHJKK3o2Wml0b29x?=
 =?utf-8?B?UnN3ZU5GTVpLRjhGbWsxc1ZSdXNLYjUrU0RUVzEvTG1CdXNxNWtibTdqc1pV?=
 =?utf-8?B?WXBldnFqdktZTEttQnl2a1RJUFU5eHRQcjNqYUJIbTJjTHBoaCtSVU90WDkx?=
 =?utf-8?B?WlNyNzFsWlN1ODJVVWFKcWdPbFI5ZmQvNExza1VvZGh3UUo2VGd0ay9mMGlT?=
 =?utf-8?B?RDVVTUhqa3hUV1hEQVhReCt5S2JvRTV0U2lycjZvNzBBQ1hCMy95NE1DZjNO?=
 =?utf-8?B?S2t6WTM4SFdwMDAvY1NNRUNZOWY0a1pkK3FLQktRSHN0N2o1azRBNXh6czBY?=
 =?utf-8?B?L25wUUNxMERxRVR2V0s4ZHVZYmpjUytVMUJUWkhoK1hReTBjV0dxWUxVVjQ1?=
 =?utf-8?B?SlVPZGtMUnhFRFN5NE5ZTE9YZ2dQN2Q5Z1dIUktKUm5MNTdmN21iTlRGaVJa?=
 =?utf-8?B?akNmUW5WS0hBaTB1Z2YrUnNIREhzS3gycXlPaVo0VWJnVW0wd0JlenBlOXB5?=
 =?utf-8?B?K3BEUkJyRVV3U2tVYlk2ZkdwcUV5UlNUVnFKNHlPcUVDeFQ2cDhRd09lcHlQ?=
 =?utf-8?B?d0FkbnNteS9wYk5rV0lwMkZ6dGx2NGEyV2xQRzY1QXo3ZWpsUmJFUUgwTGRS?=
 =?utf-8?B?Y0dWNzNoMTk4ZmtyK2lRbzFEQjJJcFNqTGJzNW9xbCtyeXZ4TXFLUm1SUGdV?=
 =?utf-8?B?Um9mOSs3dEt0Mis3V2Z1eGVuY3BJMFFjbXB4NDVnNXBOdFVzTXRvajJCcnRx?=
 =?utf-8?B?UXoxYTFBNFd1SFZja05LVFlXRThWVTNJRVlCcDlZYnFBWmpMci8rdjF2VG1B?=
 =?utf-8?B?TS9JTjZXUjhPUXRJYVVZOXhOSktHWWFhc3ZBNFN0WTRCWXY5bnVZU3l1THZH?=
 =?utf-8?B?WGNZZTN4NGF4ZCtMTzkrSUk1Z2h6c1VyanpLK09DblF3OUVHZE1Rb0MwUnNo?=
 =?utf-8?B?Q0xOdUhMYjRhSkIydGpLbmFUWlJwRGk4WlR2TS9wZUYzT25CVkxMYjJGb21L?=
 =?utf-8?B?SHgzZlAxTXpzdW84bmRBT28xOW8yZHJGa0NKdzlIVDJpWC9ralhETXhDZVZH?=
 =?utf-8?B?WG1DZUxGb2MxWVdIU2J3d0tIY3FIR0FucXJjcVNFWkh0SUhaTGZpbmVIeG9q?=
 =?utf-8?B?b1F5bVBFSXdDMTNGYjV6OVgwZUlKNWhhanlzL0Iybjl0M2pGcE1FNGREdUJa?=
 =?utf-8?B?YXQ0c2cxdnBWQkFUcFFtTmJDR3BWc1I4eHFuNnY0SWtNREMrZkI5OWVNLzFW?=
 =?utf-8?B?aCsrYnhZNTQ5MGpRNDNXeG81M2FkRUkwZU83OG9oZzVJT05XYUpGeHc0YVBm?=
 =?utf-8?B?dzBEdElkTm01RDJzL1VHc1NMT1VzL1ZVR3luUEpQSElxVWNBQktvdnBTNXBB?=
 =?utf-8?B?dmlJYllTd1pqNW1yTHlhQU01TzFJVW5jUHp2UDBrT0dtQ0N0UFFoZnVKT0Fn?=
 =?utf-8?B?NjgzMFhkdENyellZUnMzOTFxUDA1Wk1wZzV2cHFYVllMTHlRZXpQT21IMjR0?=
 =?utf-8?B?ZUg2OTM1eHJUdEliLzBQcEdLcGpNakVOTDYrWUNvTFNZck84TVhDb2g1dmVn?=
 =?utf-8?B?VUxieS9tVE4vY2ZpWFBHeTFBL091MnRnQzdScHJVL0VDWitNRGpyQ3JEbjRI?=
 =?utf-8?B?SHc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RMSnXoxPHYPKUPXkVm/XN9EJKZdYzCKL3AJXGl78Ao98kEtME5xOYKpWMKxGYJGUBKNOAxGgV+izQgh3DiIZZbqhqd4hhHRyQl7jew8ung4Y/Tq5gykzYW1M3JTdOaeXxeOrmNQhtO0TPRSELxnias5fmmueYcMsXu43Iqjyq1Ra+FsuzIyLccxSUefITDmgyVpihBngGCkVQ1SnY9AHUNH7bpkGINqy03nLViSheq7OLuI95UZfk3l1wQlCYst8rFMn5IYQ9PLPAhc0IDrgiwPcA5L3r85aciCgnUqqFteiJjHutFu3OF3myDj9E8NUKo5AlQ41VVbqSye31OpTv3+aXd7jnWk984eBFxf9Mmsm85bNHKsilcVYVK4O3jufnHYXs18mIyVAid3UsqnMcXVoxzBLd49stU8+9UQt0X9Cn/lrv37qOnMLhSIFaD/6B9zYIFyvBG18eI//phz4thDZjov5d+D6OrZVkTpZpxNBvDi5sGnDSmMGN/tKV+Vl17q23io3rBEPFKEXwIu6iaGUX06I/+lfQ0gS52o4Rpzufim7gDDi70kqFjGwHLXYEYNIWhZq1aliiuJCKUCMwDCBwszhOfu71EKBWLKcW+qGTwCVi+jHJiMp6GZ9vArhwAUS0q2NY/ZQSFBDGejLmMcicA9RTSjHNJcIsfFgPeYdozBNs8bnGcyw+mk57v4nVEsR6mURfnrNOJLQw3vMdoPc7l9Z3/DTCc33IznC8Kyr9DpIQJ7TMGPfF2CQF3dj7XQFVA0jsGEtzASZw6wmw/BBsC5uFbiwX0dU7VbNra4=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10712.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26ce697-c762-4948-b371-08db927d9987
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 10:53:54.7115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBpgp1uVYF0hhQYs8LkhNL229BBSMp+dHlNoR2avFL8/rwR5xwA7LuF4jQD9vE8WZDLa0a/jBLd+eIyIHLBOONKuAStJWRmh8n19S2z5OWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8082
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
 SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 3/3] syscalls/getgroups03: Convert to new API
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

SGkgQ3lyaWwNCg0KSGkhDQpUaGVyZSBpcyBhIHR5cG8gaW4gdGhlIHN1YmplY3Qgd2hpY2ggZ290
IG1lIGNvbmZ1c2VkIGZvciBhIHdoaWxlDQpzL2dldGdyb3Vwcy9zZXRncm91cHMvDQoNCg0KU29y
cnkgZm9yIG15IG1pc3Rha2UNCg0KMS5tZXJnZSBzZXRncm91cHMwNCB0byBzZXRncm91cHMwMw0K
Mi51c2Ugc2FmZV9tYWNybyBtYWNybw0KDQpTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx4dXlhbmcy
MDE4Lmp5QGZ1aml0c3UuY29tPjxtYWlsdG86eHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbT4NCi0t
LQ0KIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgLQ0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc2V0Z3JvdXBzLy5naXRpZ25vcmUgICAg
fCAgIDIgLQ0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc2V0Z3JvdXBzL3NldGdyb3VwczAz
LmMgfCAyNTEgKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvc2V0Z3JvdXBzL3NldGdyb3VwczA0LmMgfCAxNjMgLS0tLS0tLS0tLS0tLS0NCiA0IGZpbGVz
IGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDM1NyBkZWxldGlvbnMoLSkNCiBkZWxldGUgbW9k
ZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRncm91cHMvc2V0Z3JvdXBzMDQu
Yw0KDQpkaWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2FsbHMNCmlu
ZGV4IGIyOTE1MTEuLjE1MGRkYmQgMTAwNjQ0DQotLS0gYS9ydW50ZXN0L3N5c2NhbGxzDQorKysg
Yi9ydW50ZXN0L3N5c2NhbGxzDQpAQCAtMTMyNSw4ICsxMzI1LDYgQEAgc2V0Z3JvdXBzMDIgc2V0
Z3JvdXBzMDINCiBzZXRncm91cHMwMl8xNiBzZXRncm91cHMwMl8xNg0KIHNldGdyb3VwczAzIHNl
dGdyb3VwczAzDQogc2V0Z3JvdXBzMDNfMTYgc2V0Z3JvdXBzMDNfMTYNCi1zZXRncm91cHMwNCBz
ZXRncm91cHMwNA0KLXNldGdyb3VwczA0XzE2IHNldGdyb3VwczA0XzE2DQoNCiBzZXRob3N0bmFt
ZTAxIHNldGhvc3RuYW1lMDENCiBzZXRob3N0bmFtZTAyIHNldGhvc3RuYW1lMDINCmRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3NldGdyb3Vwcy8uZ2l0aWdub3JlIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRncm91cHMvLmdpdGlnbm9yZQ0KaW5kZXggMDY0OWEz
NC4uOWRlOTI4MiAxMDA2NDQNCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc2V0Z3Jv
dXBzLy5naXRpZ25vcmUNCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc2V0Z3JvdXBz
Ly5naXRpZ25vcmUNCkBAIC00LDUgKzQsMyBAQA0KIC9zZXRncm91cHMwMl8xNg0KIC9zZXRncm91
cHMwMw0KIC9zZXRncm91cHMwM18xNg0KLS9zZXRncm91cHMwNA0KLS9zZXRncm91cHMwNF8xNg0K
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc2V0Z3JvdXBzL3NldGdyb3Vw
czAzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3NldGdyb3Vwcy9zZXRncm91cHMwMy5j
DQppbmRleCA0OTBiMDY5Li5jMTJkNjEyIDEwMDY0NA0KLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zZXRncm91cHMvc2V0Z3JvdXBzMDMuYw0KKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zZXRncm91cHMvc2V0Z3JvdXBzMDMuYw0KQEAgLTEsMjIyICsxLDkzIEBADQorLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCiAvKg0KLSAqDQotICog
ICBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgIENvcnAuLCAy
MDAxDQotICoNCi0gKiAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyAgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQ0KLSAqICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkNCi0gKiAgIHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vu
c2UsIG9yDQotICogICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0KLSAqDQot
ICogICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxs
IGJlIHVzZWZ1bCwNCi0gKiAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgIHdpdGhvdXQgZXZl
biB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KLSAqICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlDQotICogICB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCi0gKg0KLSAqICAgWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCi0g
KiAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyAgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBT
b2Z0d2FyZQ0KLSAqICAgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0
aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQ0KKyAqIENvcHlyaWdodCAoYykgSW50
ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyAgQ29ycC4sIDIwMDENCisgKiBDb3B5cmlnaHQg
KGMpIExpbnV4IFRlc3QgUHJvamVjdCwgMjAwMy0yMDIzDQorICogMDcvMjAwMSBQb3J0ZWQgYnkg
V2F5bmUgQm95ZXINCisgKiAwNS8yMDAyIFBvcnRlZCBieSBBbmRyw6kgTWVybGllcg0KICAqLw0K
DQotLyoNCi0gKiBUZXN0IE5hbWU6IHNldGdyb3VwczAzDQotICoNCi0gKiBUZXN0IERlc2NyaXB0
aW9uOg0KLSAqICBWZXJpZnkgdGhhdCwNCi0gKiAgIDEuIHNldGdyb3VwcygpIGZhaWxzIHdpdGgg
LTEgYW5kIHNldHMgZXJybm8gdG8gRUlOVkFMIGlmIHRoZSBzaXplDQotICogICAgICBhcmd1bWVu
dCB2YWx1ZSBpcyA+IE5HUk9VUFMNCi0gKiAgIDIuIHNldGdyb3VwcygpIGZhaWxzIHdpdGggLTEg
YW5kIHNldHMgZXJybm8gdG8gRVBFUk0gaWYgdGhlDQotICogICAgIGNhbGxpbmcgcHJvY2VzcyBp
cyBub3Qgc3VwZXItdXNlci4NCi0gKg0KLSAqIEV4cGVjdGVkIFJlc3VsdDoNCi0gKiAgc2V0Z3Jv
dXBzKCkgc2hvdWxkIGZhaWwgd2l0aCByZXR1cm4gdmFsdWUgLTEgYW5kIHNldCBleHBlY3RlZCBl
cnJuby4NCi0gKg0KLSAqIEFsZ29yaXRobToNCi0gKiAgU2V0dXA6DQotICogICBTZXR1cCBzaWdu
YWwgaGFuZGxpbmcuDQotICogICBQYXVzZSBmb3IgU0lHVVNSMSBpZiBvcHRpb24gc3BlY2lmaWVk
Lg0KKy8qXA0KKyAqIFtEZXNjcmlwdGlvbl0NCiAgKg0KLSAqICBUZXN0Og0KLSAqICAgTG9vcCBp
ZiB0aGUgcHJvcGVyIG9wdGlvbnMgYXJlIGdpdmVuLg0KLSAqICAgRXhlY3V0ZSBzeXN0ZW0gY2Fs
bA0KLSAqICAgQ2hlY2sgcmV0dXJuIGNvZGUsIGlmIHN5c3RlbSBjYWxsIGZhaWxlZCAocmV0dXJu
PS0xKQ0KLSAqICAgICBpZiBlcnJubyBzZXQgPT0gZXhwZWN0ZWQgZXJybm8NCi0gKiAgICAgICAg
ICAgICBJc3N1ZSBzeXMgY2FsbCBmYWlscyB3aXRoIGV4cGVjdGVkIHJldHVybiB2YWx1ZSBhbmQg
ZXJybm8uDQotICogICAgIE90aGVyd2lzZSwNCi0gKiAgICAgICAgICAgICBJc3N1ZSBzeXMgY2Fs
bCBmYWlscyB3aXRoIHVuZXhwZWN0ZWQgZXJybm8uDQotICogICBPdGhlcndpc2UsDQotICogICAg
IElzc3VlIHN5cyBjYWxsIHJldHVybnMgdW5leHBlY3RlZCB2YWx1ZS4NCisgKiBUZXN0IGZvciBF
SU5WQUwsIEVQRVJNLCBFRkFVTFQgZXJyb3JzLg0KICAqDQotICogIENsZWFudXA6DQotICogICBQ
cmludCBlcnJubyBsb2cgYW5kL29yIHRpbWluZyBzdGF0cyBpZiBvcHRpb25zIGdpdmVuDQorICog
MSkgc2V0Z3JvdXBzKCkgZmFpbHMgd2l0aCBFSU5WQUwgaWYgdGhlIHNpemUgYXJndW1lbnQgdmFs
dWUgaXMgPiBOR1JPVVBTLg0KICAqDQotICogVXNhZ2U6ICA8Zm9yIGNvbW1hbmQtbGluZT4NCi0g
KiAgc2V0Z3JvdXBzMDMgWy1jIG5dIFstZV0gWy1pIG5dIFstSSB4XSBbLVAgeF0gWy10XQ0KLSAq
ICAgICB3aGVyZSwgIC1jIG4gOiBSdW4gbiBjb3BpZXMgY29uY3VycmVudGx5Lg0KLSAqICAgICAg
ICAgICAgIC1mICAgOiBUdXJuIG9mZiBmdW5jdGlvbmFsaXR5IFRlc3RpbmcuDQotICogICAgICAg
ICAgICAtaSBuIDogRXhlY3V0ZSB0ZXN0IG4gdGltZXMuDQotICogICAgICAgICAgICAtSSB4IDog
RXhlY3V0ZSB0ZXN0IGZvciB4IHNlY29uZHMuDQotICogICAgICAgICAgICAtUCB4IDogUGF1c2Ug
Zm9yIHggc2Vjb25kcyBiZXR3ZWVuIGl0ZXJhdGlvbnMuDQotICogICAgICAgICAgICAtdCAgIDog
VHVybiBvbiBzeXNjYWxsIHRpbWluZy4NCi0gKg0KLSAqIEhJU1RPUlkNCi0gKiAgICAgMDcvMjAw
MSBQb3J0ZWQgYnkgV2F5bmUgQm95ZXINCi0gKg0KLSAqIFJFU1RSSUNUSU9OUzoNCi0gKiAgVGhp
cyB0ZXN0IHNob3VsZCBiZSBleGVjdXRlZCBieSAnbm9uLXN1cGVyLXVzZXInIG9ubHkuDQorICog
Mikgc2V0Z3JvdXBzKCkgZmFpbHMgd2l0aCBFUEVSTSBpZiB0aGUgY2FsbGluZyBwcm9jZXNzIGlz
IG5vdCBzdXBlci11c2VyLg0KICAqDQorICogMykgc2V0Z3JvdXBzKCkgZmFpbHMgd2l0aCBFRkFV
TFQgaWYgdGhlIGxpc3QgaGFzIGFuIGludmFsaWQgYWRkcmVzcy4NCiAgKi8NCi0jaW5jbHVkZSA8
bGltaXRzLmg+DQotI2luY2x1ZGUgPHN5cy90eXBlcy5oPg0KLSNpbmNsdWRlIDx1bmlzdGQuaD4N
Ci0jaW5jbHVkZSA8ZXJybm8uaD4NCi0jaW5jbHVkZSA8cHdkLmg+DQotI2luY2x1ZGUgPGdycC5o
Pg0KDQotI2luY2x1ZGUgInRlc3QuaCINCisjaW5jbHVkZSA8cHdkLmg+DQorI2luY2x1ZGUgPHN0
ZGxpYi5oPg0KDQotI2luY2x1ZGUgImNvbXBhdF8xNi5oIg0KKyNpbmNsdWRlICJ0c3RfdGVzdC5o
Ig0KKyNpbmNsdWRlICJjb21wYXRfdHN0XzE2LmgiDQoNCiAjZGVmaW5lIFRFU1RVU0VSICAgICAg
ICJub2JvZHkiDQoNCi1jaGFyIG5vYm9keV91aWRbXSA9ICJub2JvZHkiOw0KLXN0cnVjdCBwYXNz
d2QgKmx0cHVzZXI7DQorc3RhdGljIEdJRF9UICpnbGlzdDEsICpnbGlzdDIsICpnbGlzdDM7DQoN
Ci1UQ0lEX0RFRklORShzZXRncm91cHMwMyk7DQotaW50IFRTVF9UT1RBTCA9IDI7DQorc3RhdGlj
IHN0cnVjdCB0Y2FzZSB7DQorICAgICAgIGludCBnc2l6ZTsNCisgICAgICAgR0lEX1QgKipnbGlz
dDsNCisgICAgICAgaW50IGV4cF9lcnJubzsNCit9IHRjYXNlc1tdID0gew0KKyAgICAgICB7TkdS
T1VQUyArIDEsICZnbGlzdDEsIEVJTlZBTH0sDQorICAgICAgIHtOR1JPVVBTLCAmZ2xpc3QyLCBF
UEVSTX0sDQorICAgICAgIHtOR1JPVVBTLCAmZ2xpc3QzLCBFRkFVTFR9LA0KK307DQoNCi1HSURf
VCAqZ3JvdXBzX2xpc3Q7ICAgICAgICAgICAgLyogQXJyYXkgdG8gaG9sZCBnaWRzIGZvciBnZXRn
cm91cHMoKSAqLw0KK3N0YXRpYyB2b2lkIGNoYW5nZV91aWQodm9pZCkNCit7DQorICAgICAgIHN0
cnVjdCBwYXNzd2QgKmx0cHVzZXIsICp1c2VyX2luZm87DQoNCi1pbnQgc2V0dXAxKCk7ICAgICAg
ICAgICAgICAgICAgLyogc2V0dXAgZnVuY3Rpb24gdG8gdGVzdCBlcnJvciBFUEVSTSAqLw0KLXZv
aWQgc2V0dXAoKTsgICAgICAgICAgICAgICAgICAvKiBzZXR1cCBmdW5jdGlvbiBmb3IgdGhlIHRl
c3QgKi8NCi12b2lkIGNsZWFudXAoKTsgICAgICAgICAgICAgICAgICAgICAgICAvKiBjbGVhbnVw
IGZ1bmN0aW9uIGZvciB0aGUgdGVzdCAqLw0KKyAgICAgICBsdHB1c2VyID0gU0FGRV9HRVRQV05B
TShURVNUVVNFUik7DQorICAgICAgIFNBRkVfU0VURVVJRChsdHB1c2VyLT5wd191aWQpOw0KDQot
c3RydWN0IHRlc3RfY2FzZV90IHsgICAgICAgICAgIC8qIHRlc3QgY2FzZSBzdHJ1Y3QuIHRvIGhv
bGQgcmVmLiB0ZXN0IGNvbmQncyAqLw0KLSAgICAgICBzaXplX3QgZ3NpemVfYWRkOw0KLSAgICAg
ICBpbnQgbGlzdDsNCi0gICAgICAgY2hhciAqZGVzYzsNCi0gICAgICAgaW50IGV4cF9lcnJubzsN
Ci0gICAgICAgaW50ICgqc2V0dXBmdW5jKSAoKTsNCi19IFRlc3RfY2FzZXNbXSA9IHsNCi0gICAg
ICAgew0KLSAgICAgICAxLCAxLCAiU2l6ZSBpcyA+IHN5c2NvbmYoX1NDX05HUk9VUFNfTUFYKSIs
IEVJTlZBTCwgTlVMTH0sIHsNCi0gICAgICAgMCwgMiwgIlBlcm1pc3Npb24gZGVuaWVkLCBub3Qg
c3VwZXItdXNlciIsIEVQRVJNLCBzZXR1cDF9DQotfTsNCisgICAgICAgdXNlcl9pbmZvID0gU0FG
RV9HRVRQV05BTShURVNUVVNFUik7DQoNCg0KDQpXZSB1c3VhbGx5IGdldCB0aGUgdXNlciBlbnRy
eSBvbmNlIGluIHRoZSB0ZXN0IHNldHVwIGFuZCBzYXZlIGl0IGZvcg0KbGF0ZXIgdXNlLi4uDQoN
Cg0KT0suDQoNCisgICAgICAgR0lEMTZfQ0hFQ0sodXNlcl9pbmZvLT5wd19naWQsIGdldHB3bmFt
KTsNCisgICAgICAgZ2xpc3QyID0gKEdJRF9UICopJih1c2VyX2luZm8tPnB3X2dpZCk7DQorfQ0K
DQotaW50IG1haW4oaW50IGFjLCBjaGFyICoqYXYpDQorc3RhdGljIHZvaWQgcmVzdG9yZV91aWQo
dm9pZCkNCiB7DQotICAgICAgIGludCBsYzsNCi0gICAgICAgaW50IGdpZHNldHNpemU7ICAgICAg
ICAgLyogdG90YWwgbm8uIG9mIGdyb3VwcyAqLw0KLSAgICAgICBpbnQgaTsNCi0gICAgICAgY2hh
ciAqdGVzdF9kZXNjOyAgICAgICAgLyogdGVzdCBzcGVjaWZpYyBlcnJvciBtZXNzYWdlICovDQot
ICAgICAgIGludCBuZ3JvdXBzX21heCA9IHN5c2NvbmYoX1NDX05HUk9VUFNfTUFYKTsgICAgIC8q
IG1heCBuby4gb2YgZ3JvdXBzIGluIHRoZSBjdXJyZW50IHN5c3RlbSAqLw0KLQ0KLSAgICAgICB0
c3RfcGFyc2Vfb3B0cyhhYywgYXYsIE5VTEwsIE5VTEwpOw0KLQ0KLSAgICAgICBncm91cHNfbGlz
dCA9IG1hbGxvYyhuZ3JvdXBzX21heCAqIHNpemVvZihHSURfVCkpOw0KLSAgICAgICBpZiAoZ3Jv
dXBzX2xpc3QgPT0gTlVMTCkgew0KLSAgICAgICAgICAgICAgIHRzdF9icmttKFRCUk9LLCBOVUxM
LCAibWFsbG9jIGZhaWxlZCB0byBhbGxvYyAlenUgZXJybm8gIg0KLSAgICAgICAgICAgICAgICAg
ICAgICAgICIgJWQgIiwgbmdyb3Vwc19tYXggKiBzaXplb2YoR0lEX1QpLCBlcnJubyk7DQotICAg
ICAgIH0NCi0NCi0gICAgICAgc2V0dXAoKTsNCi0NCi0gICAgICAgZm9yIChsYyA9IDA7IFRFU1Rf
TE9PUElORyhsYyk7IGxjKyspIHsNCi0NCi0gICAgICAgICAgICAgICB0c3RfY291bnQgPSAwOw0K
LQ0KLSAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBUU1RfVE9UQUw7IGkrKykgew0KLSAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKFRlc3RfY2FzZXNbaV0uc2V0dXBmdW5jICE9IE5VTEwp
IHsNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVGVzdF9jYXNlc1tpXS5zZXR1cGZ1
bmMoKTsNCi0gICAgICAgICAgICAgICAgICAgICAgIH0NCi0NCi0gICAgICAgICAgICAgICAgICAg
ICAgIGdpZHNldHNpemUgPSBuZ3JvdXBzX21heCArIFRlc3RfY2FzZXNbaV0uZ3NpemVfYWRkOw0K
LSAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9kZXNjID0gVGVzdF9jYXNlc1tpXS5kZXNjOw0K
LQ0KLSAgICAgICAgICAgICAgICAgICAgICAgLyoNCi0gICAgICAgICAgICAgICAgICAgICAgICAq
IENhbGwgc2V0Z3JvdXBzKCkgdG8gdGVzdCBkaWZmZXJlbnQgdGVzdCBjb25kaXRpb25zDQotICAg
ICAgICAgICAgICAgICAgICAgICAgKiB2ZXJpZnkgdGhhdCBpdCBmYWlscyB3aXRoIC0xIHJldHVy
biB2YWx1ZSBhbmQNCi0gICAgICAgICAgICAgICAgICAgICAgICAqIHNldHMgYXBwcm9wcmlhdGUg
ZXJybm8uDQotICAgICAgICAgICAgICAgICAgICAgICAgKi8NCi0gICAgICAgICAgICAgICAgICAg
ICAgIFRFU1QoU0VUR1JPVVBTKGNsZWFudXAsIGdpZHNldHNpemUsIGdyb3Vwc19saXN0KSk7DQot
DQotICAgICAgICAgICAgICAgICAgICAgICBpZiAoVEVTVF9SRVRVUk4gIT0gLTEpIHsNCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdHN0X3Jlc20oVEZBSUwsICJzZXRncm91cHMoJWQp
IHJldHVybmVkICVsZCwgIg0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiZXhwZWN0ZWQgLTEsIGVycm5vPSVkIiwgZ2lkc2V0c2l6ZSwNCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgVEVTVF9SRVRVUk4sIFRlc3RfY2FzZXNbaV0uZXhwX2Vy
cm5vKTsNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQotICAgICAg
ICAgICAgICAgICAgICAgICB9DQotDQotICAgICAgICAgICAgICAgICAgICAgICBpZiAoVEVTVF9F
UlJOTyA9PSBUZXN0X2Nhc2VzW2ldLmV4cF9lcnJubykgew0KLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0c3RfcmVzbShUUEFTUywNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgInNldGdyb3VwcyglZCkgZmFpbHMsICVzLCBlcnJubz0lZCIsDQotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdpZHNldHNpemUsIHRlc3RfZGVzYywg
VEVTVF9FUlJOTyk7DQotICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0c3RfcmVzbShURkFJTCwgInNldGdyb3VwcyglZCkgZmFp
bHMsICVzLCAiDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJlcnJu
bz0lZCwgZXhwZWN0ZWQgZXJybm89JWQiLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnaWRzZXRzaXplLCB0ZXN0X2Rlc2MsIFRFU1RfRVJSTk8sDQotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRlc3RfY2FzZXNbaV0uZXhwX2Vycm5vKTsN
Ci0gICAgICAgICAgICAgICAgICAgICAgIH0NCi0gICAgICAgICAgICAgICB9DQotDQotICAgICAg
IH0NCi0NCi0gICAgICAgY2xlYW51cCgpOw0KLQ0KLSAgICAgICB0c3RfZXhpdCgpOw0KKyAgICAg
ICBzdHJ1Y3QgcGFzc3dkICpyb290X2luZm87DQorDQorICAgICAgIHJvb3RfaW5mbyA9IFNBRkVf
R0VUUFdOQU0oInJvb3QiKTsNCisgICAgICAgU0FGRV9TRVRFVUlEKHJvb3RfaW5mby0+cHdfdWlk
KTsNCiB9DQoNCi0vKg0KLSAqIHNldHVwKCkgLSBwZXJmb3JtcyBhbGwgT05FIFRJTUUgc2V0dXAg
Zm9yIHRoaXMgdGVzdC4NCi0gKg0KLSAqICBDYWxsIGluZGl2aWR1YWwgdGVzdCBzcGVjaWZpYyBz
ZXR1cCBmdW5jdGlvbnMuDQotICovDQotdm9pZCBzZXR1cCh2b2lkKQ0KK3N0YXRpYyB2b2lkIHZl
cmlmeV9zZXRncm91cHModW5zaWduZWQgaW50IGkpDQogew0KLSAgICAgICB0c3RfcmVxdWlyZV9y
b290KCk7DQorICAgICAgIHN0cnVjdCB0Y2FzZSAqdGMgPSAmdGNhc2VzW2ldOw0KDQotICAgICAg
IHRzdF9zaWcoTk9GT1JLLCBERUZfSEFORExFUiwgY2xlYW51cCk7DQorICAgICAgIGlmICh0Yy0+
ZXhwX2Vycm5vID09IEVQRVJNKQ0KKyAgICAgICAgICAgICAgIGNoYW5nZV91aWQoKTsNCg0KLSAg
ICAgICBURVNUX1BBVVNFOw0KKyAgICAgICBUU1RfRVhQX0ZBSUwoU0VUR1JPVVBTKHRjLT5nc2l6
ZSwgKnRjLT5nbGlzdCksIHRjLT5leHBfZXJybm8sDQorICAgICAgICAgICAgICAgICAgICAic2V0
Z3JvdXBzKCVkLCBncm91cHNfbGlzdCkiLCB0Yy0+Z3NpemUpOw0KDQorICAgICAgIGlmICh0Yy0+
ZXhwX2Vycm5vID09IEVQRVJNKQ0KKyAgICAgICAgICAgICAgIHJlc3RvcmVfdWlkKCk7DQogfQ0K
DQotLyoNCi0gKiBzZXR1cDEgLSAgU2V0dXAgZnVuY3Rpb24gdG8gdGVzdCBzZXRncm91cHMoKSB3
aGljaCByZXR1cm5zIC0xDQotICogICAgICAgICAgYW5kIHNldHMgZXJybm8gdG8gRVBFUk0uDQot
ICoNCi0gKiAgR2V0IHRoZSB1c2VyIGluZm8uIGZyb20gL2V0Yy9wYXNzd2QgZmlsZS4NCi0gKiAg
VGhpcyBmdW5jdGlvbiByZXR1cm5zIDAgb24gc3VjY2Vzcy4NCi0gKi8NCi1pbnQgc2V0dXAxKHZv
aWQpDQorc3RhdGljIHZvaWQgc2V0dXAodm9pZCkNCiB7DQotICAgICAgIHN0cnVjdCBwYXNzd2Qg
KnVzZXJfaW5mbzsgICAgICAgLyogc3RydWN0LiB0byBob2xkIHRlc3QgdXNlciBpbmZvICovDQot
DQotLyogU3dpdGNoIHRvIG5vYm9keSB1c2VyIGZvciBjb3JyZWN0IGVycm9yIGNvZGUgY29sbGVj
dGlvbiAqLw0KLSAgICAgICBsdHB1c2VyID0gZ2V0cHduYW0obm9ib2R5X3VpZCk7DQotICAgICAg
IGlmIChzZXRldWlkKGx0cHVzZXItPnB3X3VpZCkgPT0gLTEpIHsNCi0gICAgICAgICAgICAgICB0
c3RfcmVzbShUSU5GTywgInNldHJldWlkIGZhaWxlZCB0byAiDQotICAgICAgICAgICAgICAgICAg
ICAgICAgInRvIHNldCB0aGUgZWZmZWN0aXZlIHVpZCB0byAlZCIsIGx0cHVzZXItPnB3X3VpZCk7
DQotICAgICAgICAgICAgICAgcGVycm9yKCJzZXRyZXVpZCIpOw0KLSAgICAgICB9DQotDQotICAg
ICAgIGlmICgodXNlcl9pbmZvID0gZ2V0cHduYW0oVEVTVFVTRVIpKSA9PSBOVUxMKSB7DQotICAg
ICAgICAgICAgICAgdHN0X2Jya20oVEZBSUwsIGNsZWFudXAsICJnZXRwd25hbSgyKSBvZiAlcyBG
YWlsZWQiLCBURVNUVVNFUik7DQotICAgICAgIH0NCi0NCi0gICAgICAgaWYgKCFHSURfU0laRV9D
SEVDSyh1c2VyX2luZm8tPnB3X2dpZCkpIHsNCi0gICAgICAgICAgICAgICB0c3RfYnJrbShUQlJP
SywNCi0gICAgICAgICAgICAgICAgICAgICAgICBjbGVhbnVwLA0KLSAgICAgICAgICAgICAgICAg
ICAgICAgICJnaWQgcmV0dXJuZWQgZnJvbSBnZXRwd25hbSBpcyB0b28gbGFyZ2UgZm9yIHRlc3Rp
bmcgc2V0Z3JvdXBzMTYiKTsNCi0gICAgICAgfQ0KLSAgICAgICBncm91cHNfbGlzdFswXSA9IHVz
ZXJfaW5mby0+cHdfZ2lkOw0KLSAgICAgICByZXR1cm4gMDsNCisgICAgICAgZ2xpc3QxID0gU0FG
RV9NQUxMT0MoTkdST1VQUyAqIHNpemVvZihHSURfVCkpOw0KDQoNCg0KSSBndWVzcyB0aGF0IHRl
Y2huaWNhbGx5IHRoaXMgc2hvdWxkIGJlIChOR1JPVVBTKzEpICogc2l6ZW9mKEdJRF9UKSBldmVu
DQp0aG91Z2ggaW4gcmVhbGl0eSBrZXJuZWwgd2lsbCByZXR1cm4gZXJyb3IgZXZlbiBiZWZvcmUg
aXQgYXR0ZW1wdHMgdG8NCmFjY2VzcyB0aGUgYnVmZmVyLg0KDQoNCkFncmVlLg0KDQoNCg0KDQor
ICAgICAgIGdsaXN0MyA9IHNicmsoMCk7DQoNCg0KDQp0c3RfZ2V0X2JhZF9hZGRyKCkgcGxlYXNl
Lg0KDQoNCk90aGVyd2lzZSBpdCBsb29rcyBnb29kLg0KDQoNCg0KSSB3aWxsIHVwZGF0ZSBpdC4N
Cg0KDQpCZXN0IFJlZ2FyZHMNCg0KWWFuZyBYdQ0KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
