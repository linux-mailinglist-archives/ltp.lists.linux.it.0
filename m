Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 146ED3DDBBD
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 17:01:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C02673C8AEB
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 17:01:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0F183C5D34
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 17:01:52 +0200 (CEST)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D190A1000649
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 17:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1627916511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i4ytMabs7e9FW9PhILrfm6gAzfY4RWNq+KtsW8kFky8=;
 b=Z9fcTtnnHI2r+mYPROpQiSJkj+OF4Fpp+9DyBdAE3GxwBDpcGr1FVEDQ1Rx8iLFUdPfnOa
 5uAqOkh2VkqoLRgcZe7KCFuvV1A6vZb7Cm1mX6pBq5XJWwckCQamMEpBUbN/KmsxjHR5ld
 sIFPuHqWSebFS0M58OOa4HHRhhje9vg=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-sggqrVoUOASjpRT8p0SfqA-1; Mon, 02 Aug 2021 17:01:49 +0200
X-MC-Unique: sggqrVoUOASjpRT8p0SfqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAWywXHh3A/WyD7pdmLYZzKrk3dMQFDqZqA7zUXIzGXg8saIlxM6j+OfwqOTsVENGt/MscMKBGUTBfpU68ciMoKtdwnVWO/EtZ052qnwjrL48pvXjvMIwGjOmhUVXrRx92awB61KS6nidjeCVYaANyM04EmFHoQYX/Nk2iT8Fs9OzE4nEHS8Zz6ps86xoTzxGQk+QwG0HobHySN19ZvuXWqnMmOQ/NsAryuPuNRJuUpXq3xyHHPrTauWpDpmHdG+PNxxgihGOA6Z1Uc2exshl5lQGGECU3mm6Tal1Yw4O7dmSSr4FUftvWy4BRPwRMJ3kKdhYsRH+pLFoPbOq240tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4ytMabs7e9FW9PhILrfm6gAzfY4RWNq+KtsW8kFky8=;
 b=Xl52K2qGZeoHWj0xGOON6ihRBGLxT8f7BTJMDuhmGL/IH4USBD3a3G3RTaSuxXCXGh5eTZoycQ6UoddQEuehMOW9dnZyeEEmCU0BKoVwWRlDvCBhNxzkbUpNGT24aHtip2HaXWlfZZ/eh7oZMiUcu8Ul+FzJZpCOYUxlLfJPvtcvhOLdFU6BJLkSH3UnSxv+d/1As3XTwJEMvMr71nU5zCffZKXUqkPINRIbMwo+DqNkS49dN0nmVH155jAv1U9Nw6YoO8uotKS4bGqHODW/fB+62HtVpOsc8DOt8y3ymNrXVS297tUkC2FMMRneO+x3++Nhjj3Hz2ywZF35b5nezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 15:01:49 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::318d:5853:c054:1d16]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::318d:5853:c054:1d16%3]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 15:01:49 +0000
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v1] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
Thread-Index: AQHXh6tBwlm95UOXxEukxXc6DlWhSatgSd6AgAADe3Y=
Date: Mon, 2 Aug 2021 15:01:48 +0000
Message-ID: <VI1PR04MB49588E7EF259841E40FD6CAE93EF9@VI1PR04MB4958.eurprd04.prod.outlook.com>
References: <20210802143236.28791-1-bogdan.lezhepekov@suse.com>,
 <YQgET2rMo4BSNnrq@yuki>
In-Reply-To: <YQgET2rMo4BSNnrq@yuki>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df439bbb-725e-4ff6-7f34-08d955c6742b
x-ms-traffictypediagnostic: VE1PR04MB7278:
x-microsoft-antispam-prvs: <VE1PR04MB7278BA102B8037C64F793A7593EF9@VE1PR04MB7278.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0uH44LiYlHrEW1YOry+mNT8VgpwL3WmWjz+Ee+8/e0kSzWUy7A935HKRUTzcCsMCSmetQKqx0fA7tVYB3R9REeSbSsQQWcctCQchSjq/cVOb5w51a4JJztuCd4eQn0CVIjdAFc3RJLBRbjjy1Mmuwdx3dRG7TAi8IReMpbeb/wwCkqFFAqYKyQ0AIjxZ9JDXl6iuanbpyxRvSp9WIykRl5ga2P5LGsiVUTPQQiPNrSiqZU53UEe52j00lo/gsXmLpkkfTTUTQDWeb4QSxa7mKSRZXiaYcg3lcbGWNlIWIqnCtOIfh585J3/1nbuKxLnmQfQCuGCa50vDR13kwWmPTeIHhQlt3ryPaMldLAAIv2BnRZF1vn0r4GMnyquBoQXf04fEe6dEeMR/5OesX7a9BVYpuA3r3QLCITko53er3z4KG8wp2zKS6HKe9XgpqcwmWJsP4YeDmZEkI5gfDNdwYIXMPSXWBKiXpAPNKbXk011+Erw02gp6ipFyNrck48I3YcBsTHM/t28ufap9DRcpC92AqcNwJ4I9RA4/lkLqkRtb6GvUVxCTOelSbTjGHwhJnXgDwKJTW+6jX8gJcxJx7ne9RYmO4ffWy+JDIwzoLpLPJSPphSyL4AZ20Uf1i33OcO0DdjgNkv4L42i/K0hUQ/0T0jUXacc2K42//WDLP5k4mzFkW+KzFSbhLH1tTlDAxTYE0wUlTrkKQ1di3RdK3Xz1z2Mi+wsiA5IlIFUMfXzfoDdBH5AxICtRiQ8495KTAXk/JvJUj9KW3QnN7XbjCM/RiqID8oVodXulxXQzG4Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52536014)(55016002)(26005)(71200400001)(86362001)(122000001)(53546011)(166002)(6506007)(186003)(316002)(9686003)(38100700002)(38070700005)(33656002)(4326008)(508600001)(83380400001)(2906002)(966005)(7696005)(44832011)(66946007)(6916009)(91956017)(8676002)(76116006)(19627405001)(8936002)(66476007)(5660300002)(66556008)(66446008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BuimQQBECiclmuZ4B1g5lBeaj48efabXmKWb90AqFY0J7IDE7fKttiJb+H3G?=
 =?us-ascii?Q?I/mlkFj558EInvngPqWDi3gHuOG5J4xoyDqaWf5putWEUKOIF3bvbjpK6P+K?=
 =?us-ascii?Q?5kNlLjoFcHTiOxaOi9mo2SyJyEyCkf4vulGOC57YrjyIptO3A6IzeOKrt4FD?=
 =?us-ascii?Q?BJUuOLc6jcJH9vCz/Ko8IzeN7NqPwBpWZXvDnG0JmuhfgAc32rYL5s0Kbuzk?=
 =?us-ascii?Q?+OJT2vAR3mR3a5Ucr/ReERUrcwWYHdNk1RgVGjur5SlxJaSKpKbMRmmNSgfC?=
 =?us-ascii?Q?Rsttos/8YFg9Ipdofh9nF1rhiwFjYnv56ZSUZVuVnLR+CyYHrh2ZkAFLWZhp?=
 =?us-ascii?Q?ZfWDbvzPTWJheb0uYJxKnGYm1u3YEDOa7yowoWMizat2MzLJ9bSXU60Q8Fw4?=
 =?us-ascii?Q?K7dK740mzpU5gAColmfrXic8+Tbqx06dfk5Fa1JZR8THGIh1K6B3qezU7J41?=
 =?us-ascii?Q?Zm+cfosI2ehd0yzDrfEq9PswzEgNTWxI6JAEUh6FElNfA3c6hxEqqvIV2sj5?=
 =?us-ascii?Q?1nMjzCH16rk0xoSpo0I6yZdpUqqcL51PxeRnebDf5JS2+b0QpvFH7pg6j5GS?=
 =?us-ascii?Q?EmDfM+zLRPJhfuM0Jsibxdg3lo2mqGU4pxx0+3kOgUD1bWrqu6srwanNYqz7?=
 =?us-ascii?Q?cAgWxX3VBKTFW3kxzaD1izSKoKSMMM+M20E49PRWrQ18yxHrUbInScnJajeo?=
 =?us-ascii?Q?fYXfuGJGGSKWDEVGyx+utjN9oaW9vbxLKw5Oazq0uLhfqUbYblRf/JBxdO6Z?=
 =?us-ascii?Q?ngHnqFzCVpEXzk5COtqJZfh1YT4oeXTdNBt4bL1dAN7v8Tz7eWF7qb6tzhb7?=
 =?us-ascii?Q?vw+GlaJ6uEztKhe2xsVE9Ld3DVtEaqOUioretS7lyfsPnOrnyoSa6cmGpuPH?=
 =?us-ascii?Q?7vYbescP+KjaPOSvkTlAmyF1c2+dBvO/eM/CRVybrgHG/+jGjwjRIgB73m38?=
 =?us-ascii?Q?KLwn7WUnCotZK/BecOgHvPMcfchalOqPRLopCyG3Inmj7FqtSrKo5e7wLlUY?=
 =?us-ascii?Q?gD2RjWu+jXq7+mdE4cb1jqiS4SK3OF4/L4FhCXDnFNso12qnj5qaNdfj5O/3?=
 =?us-ascii?Q?K6568lm+DSPqmyZjfCj0Xqj6IXrn56zj4pUUK+7GwfF1yliXTdx2JoLUoztp?=
 =?us-ascii?Q?TFrUxvDZBmYEnT7c6VePHQ5isTI7aMDFK3XzEPRIXXZ9ohkRhwFG4LuXNZex?=
 =?us-ascii?Q?ltrRH3gQ8FufkDMxOXzHko+q247PhWgcGDb9iAVEKZCNeP0uf1Xi6NlvzRGH?=
 =?us-ascii?Q?KmkjkNUD1vIuDyXa0Ipz13LIGa8aTOFzy5ALMQnetOd71JRqtx6Xoe/1PR73?=
 =?us-ascii?Q?ubk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df439bbb-725e-4ff6-7f34-08d955c6742b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 15:01:48.9519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztt6AU7zkOrnfLPqEgZG2Iaz1+2WFnRkXuXKClRAjqMt0YgZ42YSuKqkUpwTyMR+tQuhl9+x3oxQtq3dddoylNAVUvMs64fuMQEk8S003lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0969750788=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0969750788==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB49588E7EF259841E40FD6CAE93EF9VI1PR04MB4958eurp_"

--_000_VI1PR04MB49588E7EF259841E40FD6CAE93EF9VI1PR04MB4958eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Cyril,

Thanks a lot for reviewing.

I agree that reading kconfig every time is not fun. But would it be better =
to read it once into global variable? My concern is that your solution impl=
icitly changes expected values that might confuse people who occasionally d=
on't look at the bottom of program.

How about:

inline void _hugetlbfs_supported()
{
struct tst_kconfig_var kconfig =3D {
.id =3D CONFIG_HUGETLBFS,
.id_len =3D sizeof(CONFIG_HUGETLBFS)-1,
};

tst_kconfig_read(&kconfig, 1);
hugetlbfs_supported =3D kconfig.choice =3D=3D 'y';
}
....

static void do_test(unsigned int n)
{
struct tcase *tc =3D &tcases[n];
pid_t pid;

if (((tc->flags & SHM_HUGETLB) =3D=3D SHM_HUGETLB) && ! hugetlbfs_supported=
)
{
tst_brk(TCONF,
"Unsuitable kernel config: CONFIG_HUGETLBFS missing");
}
....

---
Thanks,
Bogdan Lezhepekov, SUSE
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Monday, August 2, 2021 17:42
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v1] shmget02: check if CONFIG_HUGETLBFS enabled i=
n kernel

Hi!
> Two tests call shmget with a flag SHM_HUGETLB, trying to
> allocate the segment using "huge" pages. The hugetlbpage
> support needs to be enabled in kernel (CONFIG_HUGETLBFS),
> otherwise shmget returns EINVAL.
>
> Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
> ---
>  .../kernel/syscalls/ipc/shmget/shmget02.c     | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/=
kernel/syscalls/ipc/shmget/shmget02.c
> index 66a4b94ee..4d515fb81 100644
> --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> @@ -32,10 +32,13 @@
>  #include <sys/shm.h>
>  #include <grp.h>
>  #include "tst_safe_sysv_ipc.h"
> +#include "tst_kconfig.h"
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/shm.h"
>
> +#define CONFIG_HUGETLBFS "CONFIG_HUGETLBFS"
> +
>  static int shm_id =3D -1;
>  static key_t shmkey, shmkey1;
>  static struct passwd *pw;
> @@ -60,11 +63,29 @@ static struct tcase {
>        {&shmkey1, SHM_SIZE, IPC_CREAT | SHM_HUGETLB, 0, 0, ENOMEM}
>  };
>
> +inline static int hugetlbfs_enabled()
> +{
> +     struct tst_kconfig_var kconfig =3D {
> +             .id =3D CONFIG_HUGETLBFS,
> +             .id_len =3D sizeof(CONFIG_HUGETLBFS)-1,
> +     };
> +
> +     tst_kconfig_read(&kconfig, 1);
> +     return kconfig.choice =3D=3D 'y';
> +}
> +
>  static void do_test(unsigned int n)
>  {
>        struct tcase *tc =3D &tcases[n];
>        pid_t pid;
>
> +     if (((tc->flags & SHM_HUGETLB) =3D=3D SHM_HUGETLB) && ! hugetlbfs_e=
nabled())
> +     {
> +             tst_brk(TCONF,
> +                     "Unsuitable kernel config: CONFIG_HUGETLBFS missing=
");
> +             return;
> +     }

We whould really update the tcases array in the setup instead as this
will re-read the whole kernel config on each do_test() iteration.

Something as:

static void setup(void)
{
        ...

        if (!hugetlb_supported()) {

                tst_res(TINFO, "SHM_HUGETLB not supported by kernel");

                for (i =3D 0; i < ARRAY_SIZE(tcases); i++) {
                        if (tcases[i].flags & SHM_HUGETLB)
                                tcases[i].exp_err =3D EINVAL;
                }
        }
        ...
}

>        if (tc->exp_user =3D=3D 0 && tc->exp_group =3D=3D 0) {
>                TST_EXP_FAIL2(shmget(*tc->shmkey, tc->size, tc->flags), tc=
->exp_err,
>                        "shmget(%i, %lu, %i)", *tc->shmkey, tc->size, tc->=
flags);
> --
> 2.32.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

--
Cyril Hrubis
chrubis@suse.cz


--_000_VI1PR04MB49588E7EF259841E40FD6CAE93EF9VI1PR04MB4958eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello&nbsp;Cyril,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks a lot for reviewing.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I agree that reading kconfig every time is not fun. But would it be better =
to read it once into global variable? My concern&nbsp;is that your solution=
 implicitly changes expected values that might confuse people who occasiona=
lly don't look at the bottom of program.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<u>How about:</u></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
inline void _hugetlbfs_supported()
<div>{</div>
<div>struct tst_kconfig_var kconfig =3D {</div>
<blockquote style=3D"margin-top:0;margin-bottom:0">
<div>.id =3D CONFIG_HUGETLBFS,</div>
<div>.id_len =3D sizeof(CONFIG_HUGETLBFS)-1,</div>
</blockquote>
<div>};</div>
<div><br>
</div>
<blockquote style=3D"margin-top:0;margin-bottom:0">
<div>tst_kconfig_read(&amp;kconfig, 1);</div>
<div>hugetlbfs_supported =3D kconfig.choice =3D=3D 'y';</div>
</blockquote>
}<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
....</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
static void do_test(unsigned int n)
<div>{</div>
<blockquote style=3D"margin-top:0;margin-bottom:0">
<div>struct tcase *tc =3D &amp;tcases[n];</div>
<div>pid_t pid;</div>
</blockquote>
<div><br>
</div>
<div>if (((tc-&gt;flags &amp; SHM_HUGETLB) =3D=3D SHM_HUGETLB) &amp;&amp; !=
 hugetlbfs_supported)</div>
<div>{</div>
<blockquote style=3D"margin-top:0;margin-bottom:0">
<div>tst_brk(TCONF,</div>
<div>&quot;Unsuitable kernel config: CONFIG_HUGETLBFS missing&quot;);</div>
</blockquote>
}<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
....</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
---</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Bogdan Lezhepekov, SUSE</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cyril Hrubis &lt;chru=
bis@suse.cz&gt;<br>
<b>Sent:</b> Monday, August 2, 2021 17:42<br>
<b>To:</b> Bogdan Lezhepekov &lt;bogdan.lezhepekov@suse.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] [PATCH v1] shmget02: check if CONFIG_HUGETLBFS en=
abled in kernel</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi!<br>
&gt; Two tests call shmget with a flag SHM_HUGETLB, trying to<br>
&gt; allocate the segment using &quot;huge&quot; pages. The hugetlbpage<br>
&gt; support needs to be enabled in kernel (CONFIG_HUGETLBFS),<br>
&gt; otherwise shmget returns EINVAL.<br>
&gt; <br>
&gt; Signed-off-by: Bogdan Lezhepekov &lt;bogdan.lezhepekov@suse.com&gt;<br=
>
&gt; ---<br>
&gt;&nbsp; .../kernel/syscalls/ipc/shmget/shmget02.c&nbsp;&nbsp;&nbsp;&nbsp=
; | 21 +++++++++++++++++++<br>
&gt;&nbsp; 1 file changed, 21 insertions(+)<br>
&gt; <br>
&gt; diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcas=
es/kernel/syscalls/ipc/shmget/shmget02.c<br>
&gt; index 66a4b94ee..4d515fb81 100644<br>
&gt; --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c<br>
&gt; +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c<br>
&gt; @@ -32,10 +32,13 @@<br>
&gt;&nbsp; #include &lt;sys/shm.h&gt;<br>
&gt;&nbsp; #include &lt;grp.h&gt;<br>
&gt;&nbsp; #include &quot;tst_safe_sysv_ipc.h&quot;<br>
&gt; +#include &quot;tst_kconfig.h&quot;<br>
&gt;&nbsp; #include &quot;tst_test.h&quot;<br>
&gt;&nbsp; #include &quot;libnewipc.h&quot;<br>
&gt;&nbsp; #include &quot;lapi/shm.h&quot;<br>
&gt;&nbsp; <br>
&gt; +#define CONFIG_HUGETLBFS &quot;CONFIG_HUGETLBFS&quot;<br>
&gt; +<br>
&gt;&nbsp; static int shm_id =3D -1;<br>
&gt;&nbsp; static key_t shmkey, shmkey1;<br>
&gt;&nbsp; static struct passwd *pw;<br>
&gt; @@ -60,11 +63,29 @@ static struct tcase {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&amp;shmkey1, SHM_SIZE, IPC=
_CREAT | SHM_HUGETLB, 0, 0, ENOMEM}<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; +inline static int hugetlbfs_enabled()<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct tst_kconfig_var kconfig =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .id =3D CONFIG_HUGETLBFS,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .id_len =3D sizeof(CONFIG_HUGETLBFS)-1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; tst_kconfig_read(&amp;kconfig, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return kconfig.choice =3D=3D 'y';<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static void do_test(unsigned int n)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tcase *tc =3D &amp;tc=
ases[n];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pid_t pid;<br>
&gt;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (((tc-&gt;flags &amp; SHM_HUGETLB) =3D=3D=
 SHM_HUGETLB) &amp;&amp; ! hugetlbfs_enabled())<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; tst_brk(TCONF,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Unsuitable kernel=
 config: CONFIG_HUGETLBFS missing&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
We whould really update the tcases array in the setup instead as this<br>
will re-read the whole kernel config on each do_test() iteration.<br>
<br>
Something as:<br>
<br>
static void setup(void)<br>
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!hugetlb_supported()) {<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; tst_res(TINFO, &quot;SHM_HUGETLB not supported by kernel&qu=
ot;);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(tcases); i++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tcases[=
i].flags &amp; SHM_HUGETLB)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcases[i].exp_err =3D EINVAL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
}<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tc-&gt;exp_user =3D=3D 0=
 &amp;&amp; tc-&gt;exp_group =3D=3D 0) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; TST_EXP_FAIL2(shmget(*tc-&gt;shmkey, tc-&gt;size, tc-&g=
t;flags), tc-&gt;exp_err,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;s=
hmget(%i, %lu, %i)&quot;, *tc-&gt;shmkey, tc-&gt;size, tc-&gt;flags);<br>
&gt; -- <br>
&gt; 2.32.0<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp">htt=
ps://lists.linux.it/listinfo/ltp</a><br>
<br>
-- <br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB49588E7EF259841E40FD6CAE93EF9VI1PR04MB4958eurp_--


--===============0969750788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0969750788==--

