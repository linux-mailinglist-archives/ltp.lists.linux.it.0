Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 261042D73D5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 11:23:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E6453C620E
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 11:23:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 629803C0887
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 11:23:01 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B751860136B
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 11:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607682180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqm3KWGjiMQp42JPDAkr7NSDCClLg5eMrRVHIkzb3y4=;
 b=mJ6FdBP8RnX4ZsLRLTH9UsOMI+F7e9dfOyN+iox7GeE3g2yfBtUq/z5GtjOfeByy4musrQ
 hF6fdIfj+ChtlfEQXlGhG5FTY/u2v4YEX+EOUZ1gEG0NBiOxoFS1jRWZD4JAu4slNolDqX
 wNqhfeeV8HT/v5xspZnEgM5nWg2W5ZM=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-iMHpX-xRNIWYVy4c_3HQbA-2; Fri, 11 Dec 2020 11:22:58 +0100
X-MC-Unique: iMHpX-xRNIWYVy4c_3HQbA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrpcM1MNzqWc61kW+8T4BJNJv04P0k+SxwVIUSTT5qWcXjICFGIgzKPjQv8kN1rgAga96kGcmLIemo+erj/zunClFqsLXMbYV40rzmvWL3NbcnauiPtnk5VG3aIeYQqh2Q98nEyMO+x45N0o1he6wK9q5PfLOGmIPePzaJ2WLHRgVm+L0zzwIAx2qSbnEU70hoAMcq0wPW6L6DgHxt3807+hZA3XxwRMn2yEjgNppCLYA4YUVgTgdUSbzyL1sO+aIjHqx55hsvpbhDUY/i32WfmnDvWpOWRvas1z+4U1j+MTYdJ+Dt0cQxn9kVioLqtGM9mvILEBvgb/EzJ+xzYBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqm3KWGjiMQp42JPDAkr7NSDCClLg5eMrRVHIkzb3y4=;
 b=T3GQJw0sussO3vfncceIhxoCObHXGB/sg3793d+ieKKCyHI6mP6UjmEYidRJ6Aaye4vSKIirhRG7c2H4mILGgY4HjH/7hx1eyw5tI29KVg1cG4NqV35UrDcApz07j04IOTfGA9QSC+PhbMdSj9hzxyQMObeWkflYDZqqraR6DcvUE9sTyQL6ZdsrYLlurlcYU8l8qxUIuAYJjZ1Kctz/ItQ2aFvwyMqr/DSDeb6LGXo7ZS0Wd+llKe8ki+f9nBJUh/KDKgTWPGjbIZEXGGSdJXcnDS86BmgwQWJ/qyfkEPmINty6X45w/bhq4T7G+u+lPSNphXkG8Ps1tsesQoutsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VE1PR04MB6526.eurprd04.prod.outlook.com (2603:10a6:803:11d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 10:22:57 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde%7]) with mapi id 15.20.3654.012; Fri, 11 Dec 2020
 10:22:57 +0000
Date: Fri, 11 Dec 2020 12:22:52 +0200
To: Cyril Hrubis <chrubis@suse.cz>, "=?utf-8?Q?ltp=40lists.linux.it?="
 <ltp@lists.linux.it>
Message-ID: <88B56050-4D68-4B88-B20D-CA7A0711A398@getmailspring.com>
In-Reply-To: <750CB65B-8F87-484D-9373-5CE4E1003413@getmailspring.com>
References: <750CB65B-8F87-484D-9373-5CE4E1003413@getmailspring.com>
X-Mailer: Mailspring
X-Originating-IP: [77.70.99.251]
X-ClientProxiedBy: AM0PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::30) To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (77.70.99.251) by
 AM0PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:208:3e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 10:22:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8b929b-84ce-4ac2-e172-08d89dbeba9c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6526:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6526B761E5DBB773FA055B3593CA0@VE1PR04MB6526.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fS31i/uRX5Nz1YOV1kbTd+COPQa114Chu1DFYK3wsmB3dTFJgvmQf8T2rrVtDXN0ru25OYtRK8QKL9u6VZ+8DzJPRla9H56smN5qDubwSZbu5e1UoiLadnEN7Smqpl0A+Ff3MQcCSatIowe5NsFEk8SCsAbM0H+09ZC/2W46VtTgXi9uF29FFR261TS2em0mRRkTdxjxQOseU3aU/Rg9EfKL2+UUpgIGXsHGFCVU11Iyvhi4JNeoLwRItpB5d5aDpp4mjH6k1/A5qDKhRjFaIyf43TcQFpjfsHRLBW5OFLnezp+XN/Nj0zDZv6Yb8yXcmzB+s3RWNH0/n+b4z7CcEnGUvbOAU6IVJU0sPOrwG/skFQLTQ9+TuoGnA21x7K+QuOf6tDFIK/rDf2PNMBqW5pfsbI/ONg/tbUYZmIABPrJaptwhRYUOyia0ApRHL7UKnahNbsc/zJhFSBsDxdXuRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(346002)(136003)(376002)(6506007)(8676002)(76236003)(956004)(44832011)(83380400001)(316002)(86362001)(110136005)(66476007)(33656002)(66946007)(478600001)(2906002)(6666004)(36756003)(66556008)(5660300002)(186003)(33964004)(69590400008)(26005)(8936002)(6486002)(16526019)(6512007)(9686003)(44144004)(52116002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjFTeDFQc1RRUW05Sm5sV3R1MFFuUVY4TE15Qll4dlE1ZENkbDJqQzA2aEF1?=
 =?utf-8?B?enVSZ3prcjM1VVhFdWhPeGcrTlUrRldhUUFvTUs5VWhmQlZkZ2RQemF4eXFx?=
 =?utf-8?B?bFFiNFlxNWltZmoxbmVOQjlCN2ptZ3I1MHl4U2RKUkxEWE9La2hsUmV4ck11?=
 =?utf-8?B?dFJydUNNb2k1TjdEUzM4ZWlZdzhsejdhTkVWUUpHeWpmUyt0WThpd3J6R0hL?=
 =?utf-8?B?WlpUVzgra3E0NnNqTml4UVcyQi9rSlppWWtMRWVqc1AxSms1SFN2d3BYS1oz?=
 =?utf-8?B?ejZPWE5tZFYvckhMaE1XRzJnSnJib0ZFTThTclJqS1k0OXhSYkIrdEk3ZDAr?=
 =?utf-8?B?Tms2WXBoZXE5UmhFMlg3cFR5M1BGWGRIbC9LZVVJTVNma1dNK0tXa2hyYmNV?=
 =?utf-8?B?STJFUW9PakNzYU00a2xseXNpazk0UjA0TlJrNTVWUGc4V2hFU2x5SUQ3OTZD?=
 =?utf-8?B?MkRNd0F3MlBNRnFqM1VGRGlTWS8wQzhkV1VTcGNud3J3RWp3ejNqNkRwN2Rn?=
 =?utf-8?B?TTFoV1B5RU85ZU1rQWRCY3Q4Zld0TlI3QktiaFhnSFJpQ08vNTRmOW5tMTAz?=
 =?utf-8?B?WHhnMSt1NVM3YmtYRHRuajU3UDdEVjVqejNlM2pUMUtzK0JDM01IK3BqVnNI?=
 =?utf-8?B?a3hNZzJCYi9TREV5YUo2a3RINEo5Q3AydTZoU2VibGFGM0RhNXoxUHp6K0NS?=
 =?utf-8?B?ZGxTQmhyTllvK0ROT3ZhRzZvZk05WENCT1YzOE8rL0gwZHRSZmxkUkhZeklx?=
 =?utf-8?B?OWJVZit6eiszQW93dnhPVzJvWnY3UUJxNERGcklyQ3RNbDlhdnZWaXBTOEpN?=
 =?utf-8?B?MW5pSVQyTnBtazQwcGZFL2dseVgvQmNZYndkYldKMzE3M3YxMzR4Ri9RVjBG?=
 =?utf-8?B?c3o5aDRMY1NHTVJwQXB0eTNaV3ZLTnZ1TUVlUlErKzdyUDhmWS9ZbytFL29R?=
 =?utf-8?B?UGk5QkZtRXZ3ck1kYjE4amhTNnZsNTJneFVrY0xWcnZFQlpmalNpN29LN05N?=
 =?utf-8?B?QmRDQkJVVzdhVVVGL1poK0UrbkpBR2RnUTRISTFNRVJDdkNuODNMcUZxM3lo?=
 =?utf-8?B?djlUWmVUb0o5U1JHRWVVSjEzTEZ5VGZvU21ZRmpWaVhOSVJuQUFTdjA4Yk04?=
 =?utf-8?B?ay9OdGFQZEJwOC82UEROYkFqbXNPZ2hjZ29xa1ZHNStGZ0V0VDZ4dzJmWkxa?=
 =?utf-8?B?VVJRUTN3V2VFL3M2ZG9ySGRJR2xKY3MyM3dUTkg5eHVSUTFpblFPUDRnR3NY?=
 =?utf-8?B?U09UQVdoZGxZWUlJL3FHV0dCZjkrd2ZZcmdPVVNCR3lWVlpsbW9aa0dud1JP?=
 =?utf-8?Q?LQ7Tqc+4uOZ/g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 10:22:57.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8b929b-84ce-4ac2-e172-08d89dbeba9c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHR2m4Eqw4DLExYTI9tVeBBTVdLYSfZF3uMJDS8Aj8/YOUs8z0ieHGLGFog4t0TgetRHvzVTJC/Qcoq9SPA8LoMNnKG/6XgmGVmi/8nhIUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6526
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0865814225=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0865814225==
Content-Type: multipart/alternative; boundary="5fd3487c_37e38aaf_198b"

--5fd3487c_37e38aaf_198b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

As follow up after chat with Petr Vorel.
A bug in the test was caused by the line "now = localtime(&nw);" in "output" function, as it sets "errno" variable somewhere.
-Bogdan
On Dec 11 2020, at 12:04 pm, Bogdan Lezhepekov <bogdan.lezhepekov@suse.com> wrote:
> Hi,
>
> By adding this comment I wanted to stress that the place of "errno = 0" is not randomly chosen, to prevent somebody from moving it back to the beginning of the file :)
> But if you find it not necessary, then please go ahead.
> Thank you,
> Bogdan
>
> On Dec 11 2020, at 11:54 am, Cyril Hrubis <chrubis@suse.cz> wrote:
> > Hi!
> > > The function output interferes with the variable errno, that leads to
> > > the false positive result on limited test setups. The issue fixed.
> > >
> > > Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
> > > ---
> > > .../open_posix_testsuite/conformance/interfaces/fork/7-1.c | 4 +++-
> > > 1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> > > index c3db90c00..4249d713d 100644
> > > --- a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> > > +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> > > @@ -53,12 +53,14 @@ static void read_catalog(nl_catd cat, char *who)
> > > {
> > > char *msg = NULL;
> > > int i, j;
> > > - errno = 0;
> > >
> > > #if VERBOSE > 0
> > > output("Reading the message catalog from %s...\n", who);
> > > #endif
> > >
> > > + /* the output function interferes with errno */
> > > + errno = 0;
> > > +
> > > for (i = 1; i <= 2; i++) {
> > > for (j = 1; j <= 2; j++) {
> >
> > This is obviously correct, but I would avoid adding the comment, it's
> > kind of obvious that anything that calls to libc may and will interfere
> > with errno.
> >
> > Also the first line of the commit description could be a bit more
> > description, half of the commits pushed to LTP are bugfixes. So maybe
> > something as:
> >
> > openposix/fork/7-1.c: Clear errno correctly
> > ...
> > I can push the patch with these changes if it's okay with you.
> >
> > --
> > Cyril Hrubis
> > chrubis@suse.cz
> >
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp


--5fd3487c_37e38aaf_198b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><d=
iv>Hi,</div><br><div>As follow up after chat with Petr Vorel. </div><br><di=
v>A bug in the test was caused by the line &quot;now =3D localtime(&amp;nw)=
;&quot; in &quot;output&quot; function,&nbsp; as it sets &quot;errno&quot; =
variable somewhere.</div><br><div>-Bogdan</div><br><div class=3D"gmail_quot=
e_attribution">On Dec 11 2020, at 12:04 pm, Bogdan Lezhepekov &lt;bogdan.le=
zhepekov@suse.com&gt; wrote:</div><blockquote><div>Hi,</div><br><div>By add=
ing this comment I wanted to stress that the place of &quot;errno =3D 0&quo=
t; is not randomly chosen, to prevent somebody from moving it back to the b=
eginning of the file&nbsp; :)&nbsp;</div><br><div>But if you find it not ne=
cessary, then please go ahead.</div><br><div>Thank you,</div><div>Bogdan</d=
iv><br><div class=3D"gmail_quote_attribution">On Dec 11 2020, at 11:54 am, =
Cyril Hrubis &lt;chrubis@suse.cz&gt; wrote:</div><blockquote><div><div>Hi!<=
/div><div>&gt; The function output interferes with the variable errno, that=
 leads to</div><div>&gt; the false positive result on limited test setups. =
The issue fixed.</div><div>&gt;</div><div>&gt; Signed-off-by: Bogdan Lezhep=
ekov &lt;bogdan.lezhepekov@suse.com&gt;</div><div>&gt; ---</div><div>&gt; .=
../open_posix_testsuite/conformance/interfaces/fork/7-1.c | 4 +++-</div><di=
v>&gt; 1 file changed, 3 insertions(+), 1 deletion(-)</div><div>&gt;</div><=
div>&gt; diff --git a/testcases/open_posix_testsuite/conformance/interfaces=
/fork/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-=
1.c</div><div>&gt; index c3db90c00..4249d713d 100644</div><div>&gt; --- a/t=
estcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c</div><div>&=
gt; +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c<=
/div><div>&gt; @@ -53,12 +53,14 @@ static void read_catalog(nl_catd cat, ch=
ar *who)</div><div>&gt; {</div><div>&gt; char *msg =3D NULL;</div><div>&gt;=
 int i, j;</div><div>&gt; - errno =3D 0;</div><div>&gt;</div><div>&gt; #if =
VERBOSE &gt; 0</div><div>&gt; output(&quot;Reading the message catalog from=
 %s...\n&quot;, who);</div><div>&gt; #endif</div><div>&gt;</div><div>&gt; +=
 /* the output function interferes with errno */</div><div>&gt; + errno =3D=
 0;</div><div>&gt; +</div><div>&gt; for (i =3D 1; i &lt;=3D 2; i++) {</div>=
<div>&gt; for (j =3D 1; j &lt;=3D 2; j++) {</div><br><div>This is obviously=
 correct, but I would avoid adding the comment, it's</div><div>kind of obvi=
ous that anything that calls to libc may and will interfere</div><div>with =
errno.</div><br><div>Also the first line of the commit description could be=
 a bit more</div><div>description, half of the commits pushed to LTP are bu=
gfixes. So maybe</div><div>something as:</div><br><div>openposix/fork/7-1.c=
: Clear errno correctly</div><br><div>...</div><br><div>I can push the patc=
h with these changes if it's okay with you.</div><br><br><div>--</div><div>=
Cyril Hrubis</div><div>chrubis@suse.cz</div></div></blockquote><br><div>--<=
/div><div>Mailing list info: https://lists.linux.it/listinfo/ltp</div></blo=
ckquote><img class=3D"mailspring-open" alt=3D"Sent from Mailspring" width=
=3D"0" height=3D"0" style=3D"border:0; width:0; height:0;" src=3D"https://l=
ink.getmailspring.com/open/88B56050-4D68-4B88-B20D-CA7A0711A398@getmailspri=
ng.com?me=3Dbf88d46f&amp;recipient=3DbHRwQGxpc3RzLmxpbnV4Lml0">=

--5fd3487c_37e38aaf_198b--


--===============0865814225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0865814225==--

