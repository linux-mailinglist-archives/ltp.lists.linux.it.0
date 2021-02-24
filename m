Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C73245CC
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 22:31:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 608313C5A72
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 22:31:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B1B0F3C5A64
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 22:31:32 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D55111400DE0
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 22:31:31 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11OLPIeF072532
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=y9GnjwZV2hQ/T0HJwazgbtgAG/Z9n4gI6PmynBlELcQ=;
 b=fSn+eH6DVEYkYsbTm/R1CEbyK4LVc89l9kowXEFyiXYaoncop4K1uMxZ1QTL25/g5AB0
 LbsPCX5M5M7qdXrVcPYFfXibxOXFHhiGNz8jS9it8b8c/VKX/wwerZmDDXU/9maDgwx4
 FvTZQ7vGo6tWwOAQzqXKKcMece+GY7l4FXOByLp4YbAkAhnC8evheAJQN5YsiNBMUYVR
 qyHYaYDqQbxSiKR9LZojkpPW2MBeHe/Oq5L8p5o72Ncqaknu1IlNUUfoqunjOF3E1HN5
 k/VQtUv1gQeIx3fSrO8EeMp5LmLj+IxUslqWsPU4HS2/uCUjJV219d3gxCP+oQ6dL7mx aQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36tsur4g2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11OLQCjk052783
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 36uc6tnjvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6TiENMJKg8mJnWYiIUo3c+O4G2fmS4U5PrJOImhg27KA0Ng9iRP8U9cuZyMgLvBlPuk48sOL6hWZNaluAmj3aRtqCs8xioXkT/VPq28gfxOLoiUh9nNXf+KALM3Tc1cWFA6ToY7LiJ/EAVApPFlfFoganK6JpLQjQRIPanMczk27TO222if4zgxlABPkNU/SonU6okmuPd6E60tZ9H5emXq6mb4+Sth39q0myA1ujw97zQDcEn7ZHgF9uvR0tyzIz0KL/PVCwZE1dXcwf07tnHACKn9Pfx14sLr8I9rgeweMEOyBK5NvIKlLdAkEn+V6mHM3TNGOa0UEUtCl8SlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9GnjwZV2hQ/T0HJwazgbtgAG/Z9n4gI6PmynBlELcQ=;
 b=eepflzsBzjHDV4oBoOqFn31UkQXYTqd3atRHZ3Aw4VtUkOkWyYd/NBlD92AWQzzspK3wIa6gRo7UsWM1aIaoY3ojLqprY3YoFbDmt3uZ8bD6fXAn3WpN8qidTrc1efdlmI2zBxqid1+gJJ4Gc+Z0vWpl0oNWG7n2BxOnfmxnoU2j9MKWaQUHhkbQ9MjAnySKAmXr6YjNBYkWGAM+DJo3RP34dzXSlZw+jxvVaL/aythY/2H0JLbNkZ8wlE2DbT2wSdbjvoiDPqt8CMT3wdlWO3Y5wltQMwe4LuGaeZawk3OqTA/hbW9EkCW24L+x/hMK9XQ1BbxY78iWmB3YB9KmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9GnjwZV2hQ/T0HJwazgbtgAG/Z9n4gI6PmynBlELcQ=;
 b=rJUXERL9NRmSjHZjulsL2gfl3p9bhYIHbCQ66Elbif2xXboP53e5dSjh0SnBfnC4Nz//YNDAOzT0rx8Phhf+UzZtUte3JeyQB5lFngHnYM9hRPb5jH9b+kjY7HMis7528GKrC1Lv3FRrmRQ057ITeKaBFjV6iPnjm25jXsgGn4Y=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR10MB1791.namprd10.prod.outlook.com (2603:10b6:301:9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 21:31:24 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89%11]) with mapi id 15.20.3890.020; Wed, 24 Feb
 2021 21:31:23 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH v2 0/1] Test brk VMA code path
Thread-Index: AQHXCvRm5OeK9XCom0W+dIKS5opfhQ==
Date: Wed, 24 Feb 2021 21:31:23 +0000
Message-ID: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.0
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aba486bb-478c-45f7-54c7-08d8d90b88f4
x-ms-traffictypediagnostic: MWHPR10MB1791:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1791AD52890A14C79B3D7045FD9F9@MWHPR10MB1791.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AGiXzi9RhkBR8t0vyUu9Mz6X/oErjFAZx3SXJWbuosMIFb53hanNK9XObDv/qS7aKBzCLQNajUvz3dBipV/1I0+6ATLeYL+YDjeKy6c6NkQhN47QgUX3FzFb/BstG5iSJoe+YfcE04YPnwmxrc8MUz6xjD1dFU1Tuwd+LedvF/4tTTUkHfD87DLXFjXrzA0NrhlbTvIFAtuC8JBNA5kiJEx+AzT3u4LtaipBwcNWizB1aFRcVaYAnd9RFzTwq+ns/fiK9K1zlW+gP7CiUH35l4ePGA+ZOdqtAuKOLRGjnE91m+Atr0V8fJj8NxPi3oc3XK/J8ISAhOvrSm9N+4cGXlm6L7M9cBCTj4c3UagVzs5r2kEVXILn2nYFnv5mOeqW9MNf4Xz3ORW8pBDgxBgPFPxYqaZ5rUaEdrloL03FlwrrK78VKXKQlq9JF1IN4iq5EZeFOdk1ZJOO9nBfd8XTRulOVf+pV/rnysdH5KujrDwS5d5NxFZcmWy17wSKYnzZ7kxmQvY8VvpIlQPAJwzc+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(396003)(39860400002)(366004)(4326008)(36756003)(71200400001)(44832011)(4744005)(6512007)(1076003)(107886003)(6506007)(2616005)(478600001)(66446008)(76116006)(5660300002)(66946007)(91956017)(8676002)(86362001)(83380400001)(186003)(64756008)(2906002)(6486002)(66476007)(6916009)(8936002)(26005)(316002)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?9LPesN7jHmFfDht/hUQqnL4v6MZijyI//TU/oueqjMQJtIrWDGlxnaCPAn?=
 =?iso-8859-1?Q?TfwFyhS+JCLbJRt1r1pIh0Fb/YGithnMi2Sx9qO1EVohlYx4Ic1Efa1mKU?=
 =?iso-8859-1?Q?78Hnv6ZJH2ag9piNIyDLwBiizibC5i0WuAp9BmfM189LPO0gtEjphPE3/Z?=
 =?iso-8859-1?Q?1TLIey16YehydHg91h3roi+XaXxfRyXU6vV2CrTOE92OuXDkjzZrNLmfo3?=
 =?iso-8859-1?Q?iMMJ2UeAhgdr4w1hy/7sg68jwVZU5WfSYt/nO5/8k73EqSPoSHcpn9yXAg?=
 =?iso-8859-1?Q?KUPmlYC6LAa8x+gRC0VIRo2C1HQNfAI8PzKzvx73USbbnWtLOoRvphvlpF?=
 =?iso-8859-1?Q?ZDJrHQ3u8zmGw8YLODTVReGrjZgBVBediOCy46v/Ysv2m7MOwC75E4fx08?=
 =?iso-8859-1?Q?qc33P19mRPSrCJxgSh/djMTQLJ57/7EUuS5LRBJ31YalIfkK6LBUoqKhly?=
 =?iso-8859-1?Q?IFHuZzgjI5JoQg7+aBL6iw8mt+QAk8s4yqV0XVVLfvQ8PxgbV901BQx9rW?=
 =?iso-8859-1?Q?cKIRAxYclBavIyYsELaWoMRD5d1mY/6N/YWznQP5PWhrTH9W0AhfAn+GL9?=
 =?iso-8859-1?Q?pkmLj7y/pzFGms9vxyOuL+o51TTbksXUftHMCdScmyPULmTuAwEPVR9aaH?=
 =?iso-8859-1?Q?P/3x8577DnTkRg/e8QqAxKukzrXvITGg035CJK8Jw0wl139V0Yp+GndGCM?=
 =?iso-8859-1?Q?aJw7irVqvc+O0PvYQvOgUyx0Cxb/qTBaG9YktZg6W1vka5keMtenh2wjEo?=
 =?iso-8859-1?Q?/AensrYnz/U/tjAJz4lM/phNuClTxhd5WZ6JjtWg5/IWo+7OJkamjp2kM9?=
 =?iso-8859-1?Q?lP/tTnCedxtDx9PaYrjsUtxCFIQn6e11nYbTW3EdEKYKprEQQS1Q04VRlE?=
 =?iso-8859-1?Q?nRkyqH9Ek30PsAwcr0vv4/2g7xoZ+GMkA6u3O9awLYLfNljDMU8i+F0MIM?=
 =?iso-8859-1?Q?KVTawamI7JzNgkqgWGoNT4HLEnzvsJA0ILBA9TMPpSWQ6Bvi2ki/XpQ/Io?=
 =?iso-8859-1?Q?yn6clVprlpLcCDK6QP3E9H/cSFULroETPPiKQVoaq8pJfz70//31Rflztx?=
 =?iso-8859-1?Q?smiWNlR2dNtlSGLHA7p/FsJZIdg+pmw7MBGVzzcq5xd1q/9N+YMC7+U0HV?=
 =?iso-8859-1?Q?MITNPM3JobjJsa8otWkYaKjNgMhzVuWceb7inQkIPLgHN6Ok2f0Ydx5hz3?=
 =?iso-8859-1?Q?JNX2GPJvbpTGqkw5i0Zcqytjg/ZPg2EvPjHmyitNMDKfoGSH0x2SNUsb7k?=
 =?iso-8859-1?Q?Y+/lcqL1rEeiGS6HmHp8yhr+W3G5TVceuvlIvJhCbgKGHPaam0TvjAnKD6?=
 =?iso-8859-1?Q?iYlwJgL752zwQj+rIZjAvBzFK4bc82XSsx3Dfh4EFtDu6yp/Zu+dyKaM+L?=
 =?iso-8859-1?Q?mkLCS/XK7j?=
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba486bb-478c-45f7-54c7-08d8d90b88f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 21:31:23.7337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /tgQlzwGirTPg/jhk3/fSR++bistgNWvFuzhAvrBuS9Xb8+lVswu6ZB6Z75PdcYmRItHZMb+K1VuaYWrp+iTjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1791
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=967 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102240166
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102240166
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/1] Test brk VMA code path
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
Cc: Liam Howlett <liam.howlett@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The brk system call uses a slightly different code path through the
kernel to expand/contract across VMAs.  This new test is written to
force the VMA to create at least two new entries and shrink back across
VMA boundaries.

V2 changes:
- White space fixes.
- Removed unnecessary include
- Added tst_res in failure paths

Liam R. Howlett (1):
  brk02: Add test for removing more than one VMA

 testcases/kernel/syscalls/brk/brk02.c | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 testcases/kernel/syscalls/brk/brk02.c

-- 
2.30.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
