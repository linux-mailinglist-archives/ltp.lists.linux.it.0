Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D59392D734B
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 11:04:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D50C3C61AE
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 11:04:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 799163C2A77
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 11:04:39 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7EE69200DAC
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 11:04:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607681077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=403LVbhNaZKV4il1FE6mxPH2L44XAYZdnGAghSPzEzo=;
 b=iJ/Zf+LcJ4zT0+NI94AWPrXyC2KFQbl5v+j1lCfEKXrCKnRmXv6nqrbuOKwbBK58I5kZ7D
 7cp6W+8saAROHfoag7mgKe7S5RRM8wb20cavLRqhIqRHAJ8/VPyCPzqXbwdDKwawoSNoTR
 8rnDtq1eMPSF1E0u3sE8selLCq67Ppk=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-TycYATwuO2mb8iv4A0ujXg-2;
 Fri, 11 Dec 2020 11:04:36 +0100
X-MC-Unique: TycYATwuO2mb8iv4A0ujXg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyM3VM+8e5imR0MGOMhXJEN1A7aSIbJGLqnAyG3Kd5YCPSfdHkzUsIQG/sQWojZN2YYjbEnmlXmJWhGl+KjMCjwKw4/MZJKZ82Fb+Jtnn6I/TbEJApIP4jmgRhHFNlj5sjTF9kgrhOyZeZwRmoJ4mwBvZwLw3Sq3y3QRiwrHY+vPYxE8fjHdLDSvHl9K9KqYykLVQAcOgI0tsPsbzRIt2dgqhFbQAbCneaJDykULrNtHuF2CF6zDXu/zTwLR9NO5VxjW6ij2qCtki/HP4I++wgx0mKz5rRXkVMXV5BNAGJWBPErm2Vmqm4dtCFLrl2Fpjod0MhEUeFwWK6xX7zq3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=403LVbhNaZKV4il1FE6mxPH2L44XAYZdnGAghSPzEzo=;
 b=VFaTtPZzROCIyO17S48ENAklNjYHeaxCMss4/w1evdgxOhYdObwpCVkCValNEByTJnOj3vM46AqPwYRzRzbOtGpq6WzKhrhyv6MklVRKvvTcjXLH2M3VmjKzWAq4gq3tA6s/0b9Kif2l1tAQMGGOU+d73L1+uXWuzAgJ1oSEAHz/1HoA1WJcpPm6UXYLSk6wIXbvBO+KyGuH4aIf5F7Y1bSkQeUo5aIRaNk/ARnG0OJY3dem4WuQ25MvN5QYgvxWOvH++0SKHv54WrioVnK9fWR60efUxCfExgW0P8GQfNv3LAbX+PPmOKD8B0X+uMa/iY+dS1qnUO9dL9annZTP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 10:04:35 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde%7]) with mapi id 15.20.3654.012; Fri, 11 Dec 2020
 10:04:35 +0000
Date: Fri, 11 Dec 2020 12:04:30 +0200
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <750CB65B-8F87-484D-9373-5CE4E1003413@getmailspring.com>
In-Reply-To: <X9NB12pkaskYs8+l@yuki.lan>
References: <X9NB12pkaskYs8+l@yuki.lan>
X-Mailer: Mailspring
X-Originating-IP: [77.70.99.251]
X-ClientProxiedBy: AM3PR07CA0070.eurprd07.prod.outlook.com
 (2603:10a6:207:4::28) To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (77.70.99.251) by
 AM3PR07CA0070.eurprd07.prod.outlook.com (2603:10a6:207:4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.9 via Frontend Transport; Fri, 11 Dec 2020 10:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d37c862a-2453-44bb-e4c7-08d89dbc29fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB6927:
X-Microsoft-Antispam-PRVS: <VI1PR04MB6927674A479C6F70F8007BE693CA0@VI1PR04MB6927.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /l3cJE9pyEVpfqd4ppEKthZCnvJPMT6uoexOkoyUs0A1yZ+UEuA2NwCdfzaGn8JnKg1zTJtxlMOKYLa8Mii5qkFkkE7N9jkwpDX8lGqmGl5KT26sGmbPTxayO/QFXyNdWRB5oRIKYmC4x02Sb1iO5PmSqMuAGrCiy68+/wUoAWe6R9Kh+nbA7a5Iy29kYG1SuRaeaM7EF1wCh1T7/pL3ukRQQcjhUfwVNd6sP3G6fBiEhSmTVcCeMXjprWBlRjH1D1yn7W/wTYtcSDv7RyImR88fzlM62eBgJcodTQyH/sKg8JQnaLDh7V39qSLLbm9NGhhAuoVdfcLhEEgD7tgrWZCZ+DgRRB44VJeA9TpSVo9j4PV0plPF1TSc7EkqxeRV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(136003)(39860400002)(76236003)(16526019)(6862004)(9686003)(4326008)(478600001)(316002)(33964004)(52116002)(6512007)(6486002)(956004)(8676002)(36756003)(86362001)(44144004)(5660300002)(66946007)(26005)(83380400001)(6666004)(44832011)(186003)(6506007)(33656002)(8936002)(66556008)(66476007)(69590400008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cDhFYmdROUo2dGdva1BLUUhTeXpHN0orV2VyQ05VaGQ2eGhGaVpGUFZWcnJL?=
 =?utf-8?B?ZUtDUEJOL1BsQVhkZzhBd0NsUStaNE9uYnJOS0N4UnJlUGZzK3EwM1JUZXl0?=
 =?utf-8?B?SEM2Q1JvekQxSGtuc1BZZDg1VXJOWHNQcHoxa3BpeHFPMndNUW95bzAyeUxU?=
 =?utf-8?B?K2NaT1RrMlF4aGFFd1lmSDZIVlNvcy9CakxNN2c3dTRQRi9KcGtnY0QwVTh1?=
 =?utf-8?B?WFNMR3FTOXFWSXIvTlZ3SjVEUWM0bUNGRlV0UlR0WTZXNjlDeVJCbmo4a2VU?=
 =?utf-8?B?TTkwR1NmYlgrVDg0Z3lVUHNrNjZhZVl5aU9TcUM3cld6MERKYUFNRUZIdFNn?=
 =?utf-8?B?Sk95YzJCcHUyV2gvc1lkK3hONkJVdE80RTlwY1RmY2dEb0EzdVRMb1lCekhv?=
 =?utf-8?B?UHc0MmJrbWEyNGdUNHVaMEVLMk1VR3IyTVQ3T1lMVmJCc1pRMTBVYjNYQXBB?=
 =?utf-8?B?dDVZNGI3WXhxR1V0enBCSEV4elk5bEdUbXBUUm9tTGpsUkFrZGJnUDJpVm9C?=
 =?utf-8?B?NkRyRXJjbHJ0ODB5L2dVS01DUGxtZzExdDZEL2x3L2cxYnI3M2Q2MWI1SGdW?=
 =?utf-8?B?WWV1MlVSR1hlMnY0OEdraDFoajUxOHhhRlVMYTJMVHVYYlRndlhJcGF0WGNn?=
 =?utf-8?B?UkV2NU5vMmJDN2NpeUdJRjk3dnlpUEdTNGIzQTJhRnhPdkE1dEdjNWZ5SXBk?=
 =?utf-8?B?b3VLNzBTVmduMTZ2eUxieDcrNW9zdk9jcmJONnVUOFNJOW9SSVlkbjNiN29l?=
 =?utf-8?B?Umd0ZnBFZVFLWEt0ZnY3T2NLbHM4ZVMvL2tMQjRhaXU1WWJYQThCY3NSKysx?=
 =?utf-8?B?NkdtWC9RVkUwaFB6U25OdTJIRThHSmh3R3ZuemRNVXdxNE1jdnZpMVQ2aWtB?=
 =?utf-8?B?cjRlUjNCRWVObm92RWZPNU01WEMxdHB5R3YyZjdIRmNHZnVuZG8rejlSek1Y?=
 =?utf-8?B?RFRZc28xMVUwc216NDNnZDNMRFYzSzFKcDF5ZVN0bENhYzFRUTAxclEra09n?=
 =?utf-8?B?eU53UHFYa1k3RE5SclhtcWFqMWFHeVRhdjZoMnhqWmpGSkM1V0lvKzRlQ0Qz?=
 =?utf-8?B?NUY0ZGV0Qmo4eCtXVFdyOUwxZmwwWllEMHVMSjVFSVh4UEh1ZWR4dTJsa0NP?=
 =?utf-8?B?M1ovV3ZUMW1jTUhNWU9sZ2lXTy95T2N4d29OVnhkQlRXQjdGWHp5RUpUZHFS?=
 =?utf-8?B?MFBPZmI2VTEwZmNYcXRJMHhnTGZZNXNhdXF2b0FudU9Kc0d2dVI0RkttSGZP?=
 =?utf-8?B?L1A5SWxmVXpoZFkzckxTSllhRXh2SnA4RUx0YWJ0T3pEOS9DZ29MaCsreHgw?=
 =?utf-8?Q?Amw6RYcncZPjo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 10:04:35.5872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: d37c862a-2453-44bb-e4c7-08d89dbc29fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWoEYZyBidF278PI4bMfiW0rtE0tlb+6IghKEQa0kE7JDvSqJKUOpKH2ofT7YjaAbivH/ZVayvFkaiviAkiuWLV6L0Al9IkFqVZbPKWm6Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_IMAGE_ONLY_32,HTML_MESSAGE,
 MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] openposix/fork/7-1.c: A bug fix
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
Cc: "=?utf-8?Q?ltp=40lists.linux.it?=" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0911530105=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0911530105==
Content-Type: multipart/alternative; boundary="5fd3442e_d424f8c_198b"

--5fd3442e_d424f8c_198b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

By adding this comment I wanted to stress that the place of "errno = 0" is not randomly chosen, to prevent somebody from moving it back to the beginning of the file :)
But if you find it not necessary, then please go ahead.
Thank you,
Bogdan

On Dec 11 2020, at 11:54 am, Cyril Hrubis <chrubis@suse.cz> wrote:
> Hi!
> > The function output interferes with the variable errno, that leads to
> > the false positive result on limited test setups. The issue fixed.
> >
> > Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
> > ---
> > .../open_posix_testsuite/conformance/interfaces/fork/7-1.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> > index c3db90c00..4249d713d 100644
> > --- a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> > +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> > @@ -53,12 +53,14 @@ static void read_catalog(nl_catd cat, char *who)
> > {
> > char *msg = NULL;
> > int i, j;
> > - errno = 0;
> >
> > #if VERBOSE > 0
> > output("Reading the message catalog from %s...\n", who);
> > #endif
> >
> > + /* the output function interferes with errno */
> > + errno = 0;
> > +
> > for (i = 1; i <= 2; i++) {
> > for (j = 1; j <= 2; j++) {
>
> This is obviously correct, but I would avoid adding the comment, it's
> kind of obvious that anything that calls to libc may and will interfere
> with errno.
>
> Also the first line of the commit description could be a bit more
> description, half of the commits pushed to LTP are bugfixes. So maybe
> something as:
>
> openposix/fork/7-1.c: Clear errno correctly
> ...
> I can push the patch with these changes if it's okay with you.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>


--5fd3442e_d424f8c_198b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><d=
iv>Hi,</div><br><div>By adding this comment I wanted to stress that the pla=
ce of &quot;errno =3D 0&quot; is not randomly chosen, to prevent somebody f=
rom moving it back to the beginning of the file&nbsp; <span data-emoji-typi=
ng=3D"true">:)</span>&nbsp;</div><br><div>But if you find it not necessary,=
 then please go ahead.</div><br><div>Thank you,</div><div>Bogdan</div><br><=
div class=3D"gmail_quote_attribution">On Dec 11 2020, at 11:54 am, Cyril Hr=
ubis &lt;chrubis@suse.cz&gt; wrote:</div><blockquote><div><div>Hi!</div><di=
v>&gt; The function output interferes with the variable errno, that leads t=
o</div><div>&gt; the false positive result on limited test setups. The issu=
e fixed.</div><div>&gt;</div><div>&gt; Signed-off-by: Bogdan Lezhepekov &lt=
;bogdan.lezhepekov@suse.com&gt;</div><div>&gt; ---</div><div>&gt; .../open_=
posix_testsuite/conformance/interfaces/fork/7-1.c | 4 +++-</div><div>&gt; 1=
 file changed, 3 insertions(+), 1 deletion(-)</div><div>&gt;</div><div>&gt;=
 diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-=
1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c</div=
><div>&gt; index c3db90c00..4249d713d 100644</div><div>&gt; --- a/testcases=
/open_posix_testsuite/conformance/interfaces/fork/7-1.c</div><div>&gt; +++ =
b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c</div><di=
v>&gt; @@ -53,12 +53,14 @@ static void read_catalog(nl_catd cat, char *who)=
</div><div>&gt; {</div><div>&gt; char *msg =3D NULL;</div><div>&gt; int i, =
j;</div><div>&gt; - errno =3D 0;</div><div>&gt;</div><div>&gt; #if VERBOSE =
&gt; 0</div><div>&gt; output(&quot;Reading the message catalog from %s...\n=
&quot;, who);</div><div>&gt; #endif</div><div>&gt;</div><div>&gt; + /* the =
output function interferes with errno */</div><div>&gt; + errno =3D 0;</div=
><div>&gt; +</div><div>&gt; for (i =3D 1; i &lt;=3D 2; i++) {</div><div>&gt=
; for (j =3D 1; j &lt;=3D 2; j++) {</div><br><div>This is obviously correct=
, but I would avoid adding the comment, it's</div><div>kind of obvious that=
 anything that calls to libc may and will interfere</div><div>with errno.</=
div><br><div>Also the first line of the commit description could be a bit m=
ore</div><div>description, half of the commits pushed to LTP are bugfixes. =
So maybe</div><div>something as:</div><br><div>openposix/fork/7-1.c: Clear =
errno correctly</div><br><div>...</div><br><div>I can push the patch with t=
hese changes if it's okay with you.</div><br><br><div>--</div><div>Cyril Hr=
ubis</div><div>chrubis@suse.cz</div></div></blockquote><img class=3D"mailsp=
ring-open" alt=3D"Sent from Mailspring" width=3D"0" height=3D"0" style=3D"b=
order:0; width:0; height:0;" src=3D"https://link.getmailspring.com/open/750=
CB65B-8F87-484D-9373-5CE4E1003413@getmailspring.com?me=3Dbf88d46f&amp;recip=
ient=3DbHRwQGxpc3RzLmxpbnV4Lml0">=

--5fd3442e_d424f8c_198b--


--===============0911530105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0911530105==--

