Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF52A6360
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 12:34:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB5B33C5458
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 12:34:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8132A3C239E
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 12:34:13 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [51.163.158.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D33701401454
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 12:34:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604489652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adN2H2uu0B66vME+o43ClYK1zTLBSfZXRNVuxjljK+M=;
 b=noErJoR+E1jAl+vSQHZYqKIume2IBKSonw1ml9SB0wHkz1DIbluRhzQfbFFVi08unLLhwt
 Fni8C/19zgyRxI/jqKnO9jrhoXmntHwExbs+ukvX8XUHn6hz5kqDctPG+FZXFYK+OYoEXw
 yuUf4e4zXsAAnCifbom0EEE6DPTgAmA=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-oR3DilxpNCGf_qF7QToGLg-1; Wed, 04 Nov 2020 12:34:10 +0100
X-MC-Unique: oR3DilxpNCGf_qF7QToGLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1Q7Tfn6LETxEWjt5pUKeBO+79/SYGz8fSs02uZZuJio1fqAIXsT/6nakA3KN0WfuzGNTpUExyp5ra35XiMip9e4WMHkpK6WOKqWsCzxSO9lBnVzqy5Kx7AyVO8xh8/E2baS3WBbNLe7xn15C4HxVyKJx3s1w8Hks863AK9w+H+zktpBkwPqsWzb9Dz+HsxMXFA40Mgb1W36Oat0bMqGybjK04/ZZI7FhIFHyfSGtoH+rhw5EAAAr35vMHHsnFJYNYw/JhmE8RdwMaQLxErWdKT3moXuiN/MLg/cBrwqBk4eQWrSwAyp1ihidlj5AocGwpe7Lx2c6Jbt7mX9NFlrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adN2H2uu0B66vME+o43ClYK1zTLBSfZXRNVuxjljK+M=;
 b=JFjAlY+ZO6/PjUnIdWw0o+78bAt4smqrhdlLkjJoqcWwoJ75wRrkhUGA5aI8ZBUMMQn3k5CZUlDfLzXkjDjCQe7ePcL40C2ayf+7ky5NW0t8duxpOgwPm746sykjHAQyOT+MqvI8zElXm/Al/1RBs+CLOrdYKh8EaUNQxx1Dc5WXL9LEYKgV+vHzYgVdWk8+CmnqAJg1uTQc8yT1jOmL3EAnh9HH6N6XDbfyOysyk5RJVmV3F2z1Ygkg0h/TUwXU7bjK7GLWNV2iKhvGobqXXCEBuGTl0xx1O2H7PGqwDkl3b92Kfi6uG2y3hkLIhRPiPMcbI0JlXr54faRv5E79yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR0402MB3662.eurprd04.prod.outlook.com
 (2603:10a6:803:1c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 4 Nov
 2020 11:34:09 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 11:34:08 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>, "pvorel@suse.cz"
 <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 05/11] syscalls: Add a few documentation comments
Thread-Index: AQHWshWN8yFqMlMyo0ignK4koVk7yqm32KMA
Date: Wed, 4 Nov 2020 11:34:08 +0000
Message-ID: <d0e937e67108585af4423e9f688941cb194476ba.camel@suse.com>
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201103191327.11081-6-pvorel@suse.cz>
In-Reply-To: <20201103191327.11081-6-pvorel@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
x-originating-ip: [85.196.172.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cd4bc35-9844-44f9-3373-08d880b58b62
x-ms-traffictypediagnostic: VI1PR0402MB3662:
x-microsoft-antispam-prvs: <VI1PR0402MB36621F6A47B7B921FC878724E0EF0@VI1PR0402MB3662.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F8mwtTWgWrxB87FPYaYk7zEAh3M0JvGCyzP6ntnEQCbC4/O5Ps9/WocXIooa5u9Qa30vMtVNtphw7eDvCySIcuzyzqAMsE3wm6L9t26OmrXEIyIt1MzTMwcAYjC4CkV6+qgHoaY2K7bB5evYuR2INfVUYimXYJWS4nAX08E3iRDy7lj4dZvB+Hb93uouUPHgPI4ECc3V9c5JjMMcSDAA1fvbOsze5KLSrAt6wrp7O1ibNC38ipT9zFPwrG/gLklhloaCXiIfldIO059inZ7hpJy4t02UHtD4CqkyKersJSKDGwjv01kaY1Up47QkSou7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(136003)(39860400002)(366004)(4744005)(5660300002)(186003)(2616005)(316002)(86362001)(478600001)(71200400001)(44832011)(110136005)(8936002)(76116006)(64756008)(66446008)(66476007)(83380400001)(66556008)(91956017)(54906003)(2906002)(6506007)(36756003)(6512007)(6486002)(8676002)(66946007)(26005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: D6ZGp3lovqg4AbXFJyMauo5RWTYgTDk5Wkbtbb8Hcf0riXyXPOtVLwjexE9m3u25pOwKpyl2jwZ/kXpbsOef/wCVFFilASVqHxZfyXTjz0OSeYf4BoMjx2MPr3HgZ6ulWLyf76Ha2X0yZTRlBmysESrk+tJwE7JQItVNKT7qcctqOptE0Fs0hfXggfQs0f2ZmYTYcDyt3jZV2fgNhvWZN6OhRrj3ufCpi0tYo8HCbMR4/l8TIgDZ53UUshWlsRCsuj9CvEjbUeDxmTnwaIGVpT+0uIjuz+VYXJb3oSMxS0cFyPnC0z/4WO5JV+urojGIAb9Ic9elkfMA+RsciFZJIUQ9nXzy6q8+yQST5rOT+ux/bgd8ZjTX9M0xGjPK9brxA7V4P5Nf+9AgQjXGT/EnUcLkr9x3ibLMHkmRMrq8vmxDCWouOo0/xSVinzWsGWaGr9rt9PSg1myd0/brGuMh4ZiYef9L0UU9BMD0lLcMukHfjJvUB8ISGMAhME4qOetryqKSyNcX831FbO3/55KDiynzq7Jtq6lL7cuS25a2h1oHzVjpSN9iN2ktYbMviX9pYAOu6rISCZ+b0WUx3c9IJ0oAfkSHn8i3mVAKtZsylwORQyFtA1CrOQEBonkjI0u/gdhOevJkaZEE0npxFaG4Fg==
x-ms-exchange-transport-forked: True
Content-ID: <25FAA2292CE7E340963CABB743960433@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd4bc35-9844-44f9-3373-08d880b58b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 11:34:08.7340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qM54vMUzLtojB9Od6GDEkwiIVM93Cwe8huInKQgtgp+d6S1oalPtomAA7IZ2FZw/UfxM5750ETUSgVqwrbtq7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3662
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 05/11] syscalls: Add a few documentation
 comments
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
Cc: "metan@ucw.cz" <metan@ucw.cz>,
 "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

On Tue, 2020-11-03 at 20:13 +0100, Petr Vorel wrote:
> 
> + * [DESCRIPTION]
> + *  Checks that process which called abort() gets killed by SIGIOT
> and dumps core.

...

> +/*\
> + * [DOCUMENTATION]
> + *  Verify that acct() returns proper errno on failure.
> +\*/
> +

I noticed that in some places the DESCRIPTION tag is used and in
another DOCUMENTATION. What is the difference between the two and which
should be used when?

Regards,
Rado

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
