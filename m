Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E3C2E7F64
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 11:38:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C869D3C5560
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 11:38:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C40BC3C2612
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 11:38:24 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 073C7100079B
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 11:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1609411102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e2PqEZ7L5l0ZgqdvrMTSznnwgD7zyXUXzz491NXhszc=;
 b=h92OJOlRecA8101N8aEaF1YeHSdC8ZTo2tYyj6qY6+kVIdSGoNqzeW/4kim/vbQjtV4JA6
 5rhJEFwr9kcTWEJ6QbDSbANlW7RKkaTSapgFbemQc0LM4vuuIKP3JuOb6S2HYnp6qZ0/BX
 iuKGbQWUOcxQUFExxIHy9YbQow5pyZA=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-LlLjKbZqMmmq5zG8oOXXrg-1; Thu, 31 Dec 2020 11:38:21 +0100
X-MC-Unique: LlLjKbZqMmmq5zG8oOXXrg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1iQ7/67HKxqUXKzbdEni9Qzpq1jvkUxVNCyJVDRqbF+22a0fwwy1tqfcVBhs9Hf4xR5OQPyCAOGISgjTUkIixWrwsLBr/rAgB+FothDG8HJGF2RWQmmzBBui0eSFL+a0u8vwAKsoKyAJWscgLzdGcD00APvvDYJf2ZJzmvcR5Oj0yxvx6MnjlrKnaIW42cup1umzXV8lMaefFLG9GyvKeUHzPXVEzdOH0kabhrgUtshT+BOjW0dErZMcEaLTgLuTLmot/2XlZUpUwiudi41mfjepqRZ9UYy1wlj+bAkZ5WcHrDD6RbOhdERZZda0DS/V2m186plT0+4pQnNAwxNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2PqEZ7L5l0ZgqdvrMTSznnwgD7zyXUXzz491NXhszc=;
 b=hmY17BA0turrkxJMxSsEhE38n9VmzrqMjk1hsXDuDoRhlT0hA+qOXI/3iqwqczqVPZisD6PF5s4mIZdW5is3VRyPc115HGGl8dfgoKxfn4+w/Md1Typqw8tYHu4wf7tH4PtmFLTW1OKEmKgkJTMWoB6aJ3V8QKNYH1QkOoGl8KQ5ocHL/oneUtFS+W64qu6h32BF1VCMQaL17Xp5qecSJfF8IX1EUz5ww9SBIo9EdlWQXOEEfctnMGGP/Wp/6nce3RV08tzaJTt3e4YqTn1CwUXh+DNZEFLzL5QV8d9Aps+dmf59RStCQ42PXsBVwLI+br2pa4IhrZhQBuHa4/4GUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 31 Dec
 2020 10:38:20 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::91d9:719a:add5:392e]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::91d9:719a:add5:392e%6]) with mapi id 15.20.3700.031; Thu, 31 Dec 2020
 10:38:20 +0000
Date: Thu, 31 Dec 2020 13:38:13 +0300
To: Li Wang <liwang@redhat.com>
Message-ID: <96F5BFE2-CF01-480E-B607-807A87003ABF@getmailspring.com>
In-Reply-To: <CAEemH2d88KVzzidLyEmCPm+LrXiE0zG7YvXG=r=AgEy+2jKU-A@mail.gmail.com>
References: <CAEemH2d88KVzzidLyEmCPm+LrXiE0zG7YvXG=r=AgEy+2jKU-A@mail.gmail.com>
X-Mailer: Mailspring
X-Originating-IP: [46.32.67.173]
X-ClientProxiedBy: AM6P195CA0077.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::18) To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (46.32.67.173) by
 AM6P195CA0077.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Thu, 31 Dec 2020 10:38:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 553772aa-d9a9-4314-5c7d-08d8ad783109
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3520269E8D1EC26D008C8CA893D60@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJgeMGc7Q07aY7G7bBtLC8JQ5rhjxtM1IpvIr4D39YMWMGfTW9rmDtyeRGElOC/xcruR9u3pS33K6i95w8CjveFPfr2A2jm56KBQZSR3Rk7rpMUPaVZCcP/7epQxleXghBbk+NV7bqKzwabXt0gHgydxm/kAuPmqXeclmYHLfBc209n2FI0IfPsigbcOXF40Wjl6XAnuCCS2rDCUihXhhtMzuoxp6v3Y0QyiqRX/NagK3dwtYGE5EeEZ5mLIFFMDmJoKF+M9aynaHvBMBx+pYGOF/qgZqtWIY9I6gN7n2x+jZWrZJX/762y1R8i4VItC6V4eZBJ8RlKfBZKHBRM3Nhm5HuRQVj8y4NbxAX42Z+Q0c8Bw2dOIOJuLeKoRDoU88WlUJ/dVVcqdC/ZqQdm1qS/TapLwMplZLHXTTjGiX9NOtrPVSFidVG3yTuv1NGGvbSHd1OkMwEeh/I9ndokkJVQbPZoIV+U5RIsQevZhrUuR6Xs2Domta03VQqKhoS5NQoeunCs88urFB+s1DBZW2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39860400002)(346002)(366004)(376002)(6666004)(6862004)(69590400010)(54906003)(478600001)(316002)(956004)(5660300002)(36756003)(26005)(33656002)(83380400001)(33964004)(44144004)(6506007)(53546011)(966005)(21615005)(4326008)(107886003)(166002)(66476007)(8676002)(2906002)(44832011)(9686003)(52116002)(66556008)(186003)(86362001)(8936002)(76236003)(16526019)(6512007)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mlp3OE43UlI0VFFSc1lBZGNUelZteUtYRGZSUzg5Q1cydlhrUUthU3I5Smg5?=
 =?utf-8?B?d2dJMmhsTmpJYW9FdGJOM1V6cUd2cENWWlVINkR4dVlNeWk2Vi9POEtqdXc3?=
 =?utf-8?B?MHZvVmx4YURJZEY1TzNWZkVydUtUUTRsSUtwcjAzMHBTRWhSL0dyMVZnWnU5?=
 =?utf-8?B?dmxTNVdqazZEcy9BUVVKRC9ILys4TU9wakthZEU0akllWk96cHRDalRiN1dR?=
 =?utf-8?B?NnpabjNBM1NoTTgvN3IwVS9WUnhSWkNEL3l6WlZVZkdFSTNVczdmNGVsMlY0?=
 =?utf-8?B?TmxRajFMbUZneHZxWTAyVnU0ekZLTjZTaEMwdC9yNUYyMnZPNkJUL0hFWFp6?=
 =?utf-8?B?Y2pTVXJlRkpNaVpKN3JWeXoxWnFhN2FHbE9GOU5sd2QzcTlzNktSakFlRXJa?=
 =?utf-8?B?SnZYZkgyMVVySnU4WmZidFg5YTJ1Tk1UQjBCcWFXM1dRTm1uaWtyUm9ZNE0y?=
 =?utf-8?B?RWk5RkdDVFJxZkQxM09JelB2QjgyNzUzZzZzbld1Qyt0UTk2YmhENzZlSUhP?=
 =?utf-8?B?V2dqc3kwWnAveGtuMUc2ZTlsRnM0a1Z3RCtVSU1SQVBzZWwwaTR1L1M5aEZp?=
 =?utf-8?B?Ym9STHlZd01DRk9KRVRuL2VHL2M3dTg2c21LNm5pL09HeGU4Ulh3Mlc5ZlF2?=
 =?utf-8?B?TWNTaDBiVkFDSXRzdktjSFZWRTB2UitobzFYaUtQM29uejdIM0taS2taK01k?=
 =?utf-8?B?alhSeGlKNFhuWjhSSndhMkZLQlF1SjNUdGZUSFFBTzVLU2h5UVhhUHVscG4z?=
 =?utf-8?B?cTgzbThhQnlmaFdKcXRTQm1VditoMVFJSFRibTF6QW9reVZxeUJVMGwrc01J?=
 =?utf-8?B?Wis4dFlCcFJDa2NsRThlMXRtS3NaSlc1V1dJTldYZlRjNHBUMysrMElyR0RL?=
 =?utf-8?B?eGc5STgyUjcyMTZIZ2IyYjlMYVZ2YnJ1RUVrVVdJNmMwNTJ1U0JYYi9oTEd1?=
 =?utf-8?B?cUx4SkVrQ3QvSUhwTzdVUkFERmFWWFBCQnBnV1hkLzhNUHp1Zkt1VnFoVEEw?=
 =?utf-8?B?ZnkxaGFteWFVWi9pdEVQR2ZJd2N0RGQvNWc2aUFwdEcxRnlzTVpxWG43UUU4?=
 =?utf-8?B?UDhWVVpCWUk2SW5EUUl5V1hrMmtYZzRXZnBQSGpjOStTRUNLRHJ5eWdxYklh?=
 =?utf-8?B?YkVCcHJjQ0RDdnNaRlBzc2cySksxS0xkUVV3K2swQmtIV0NKME9JK3UramND?=
 =?utf-8?B?WTNia1VReVhPRTl0aXF5dFJHVGszWjNWaUtPVE1yVW8rYUlsKzBTbDBDUFFl?=
 =?utf-8?B?UWZWUDRCWWdtZFlVektiYTkrVkpZTEE1SnJMdHBsQ3FySTN3dW5jdXhweHFG?=
 =?utf-8?Q?9P5J5ze6hezek=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 10:38:20.2103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 553772aa-d9a9-4314-5c7d-08d8ad783109
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojGLj5M75KFB36neL2bQ1OtU8+C0JE7ECtsSF1GEHeAOgWusAqizF6fjR9ty0sRMoBv/CU8u7JQCB5Omk9OUChTcHgKzjTv120C+eEZ6ITQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] include/tst_cgroup.h: Replace hardcoded cgroup
 paths
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0130754536=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0130754536==
Content-Type: multipart/alternative; boundary="5fedaa15_3fd37fd1_1628"

--5fedaa15_3fd37fd1_1628
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Li,

Thanks for the review and pointing to the Richard's update, haven't seen that before.
Regards,
Bogdan

On Dec 31 2020, at 6:01 am, Li Wang <liwang@redhat.com> wrote:
> Hi Bogdan,
>
>
> On Wed, Dec 30, 2020 at 11:49 PM Bogdan Lezhepekov via ltp <ltp@lists.linux.it (mailto:ltp@lists.linux.it)> wrote:
> > Macros PATH_TMP_CG_CST and PATH_TMP_CG_MEM defined cgroup
> > temporary directory paths to be in /tmp that can be a mount point.
> >
> > Enable an option to set PATH_TMP_CG_CST and PATH_TMP_CG_MEM
> > through TMPDIR environment variable keeping old paths as default ones.
> >
> > Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com (mailto:bogdan.lezhepekov@suse.com)>
> > ---
> > include/tst_cgroup.h | 5 +++--
> > 1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
> > index bfd848260..0f7db5487 100644
> > --- a/include/tst_cgroup.h
> > +++ b/include/tst_cgroup.h
> > @@ -7,8 +7,9 @@
> > #ifndef TST_CGROUP_H
> > #define TST_CGROUP_H
> >
> > -#define PATH_TMP_CG_MEM "/tmp/cgroup_mem"
> > -#define PATH_TMP_CG_CST "/tmp/cgroup_cst"
> > +#define PATH_BASE (getenv("TMPDIR") ? getenv("TMPDIR") : "/tmp")
> > +#define PATH_TMP_CG_CST (strcat(PATH_BASE, "/cgroup_cst"))
> > +#define PATH_TMP_CG_MEM (strcat(PATH_BASE, "/cgroup_mem"))
>
>
> As described on strcat() manual page, the potential risk is that buffer overruns might cause an unpredictable problem.
>
> I won't like to merge this patch because, Richard raised a new method to refactor the whole CGroup API. And the patchset is pending on reviewing.
>
> http://lists.linux.it/pipermail/ltp/2020-December/020274.html
>
> --
> Regards,
>
> Li Wang
>
>
>
>


--5fedaa15_3fd37fd1_1628
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><d=
iv>Hi Li,</div><br><div>Thanks for the review and pointing to the Richard's=
 update, haven't seen that before. </div><br><div>Regards,</div><div>Bogdan=
</div><br><div class=3D"gmail_quote_attribution">On Dec 31 2020, at 6:01 am=
, Li Wang &lt;liwang@redhat.com&gt; wrote:</div><blockquote><div><div><div =
class=3D"gmail_default"><font style=3D"font-size:small">Hi Bogdan,</font></=
div></div><br><img class=3D"mailspring-open" alt=3D"Sent from Mailspring" w=
idth=3D"0" height=3D"0" style=3D"border:0; width:0; height:0;" src=3D"https=
://link.getmailspring.com/open/96F5BFE2-CF01-480E-B607-807A87003ABF@getmail=
spring.com?me=3Dbf88d46f&amp;recipient=3DbHRwQGxpc3RzLmxpbnV4Lml0"><div cla=
ss=3D"gmail_quote"><div class=3D"gmail_attr"><div>On Wed, Dec 30, 2020 at 1=
1:49 PM Bogdan Lezhepekov via ltp &lt;<a href=3D"mailto:ltp@lists.linux.it"=
 title=3D"mailto:ltp@lists.linux.it">ltp@lists.linux.it</a>&gt; wrote:</div=
></div><blockquote><div>Macros PATH_TMP_CG_CST and PATH_TMP_CG_MEM defined =
cgroup</div><div>temporary directory paths to be in /tmp that can be a moun=
t point.</div><br><div>Enable an option to set PATH_TMP_CG_CST and PATH_TMP=
_CG_MEM</div><div>through TMPDIR environment variable keeping old paths as =
default ones.</div><br><div>Signed-off-by: Bogdan Lezhepekov &lt;<a href=3D=
"mailto:bogdan.lezhepekov@suse.com" title=3D"mailto:bogdan.lezhepekov@suse.=
com">bogdan.lezhepekov@suse.com</a>&gt;</div><div>---</div><div>&nbsp;inclu=
de/tst_cgroup.h | 5 +++--</div><div>&nbsp;1 file changed, 3 insertions(+), =
2 deletions(-)</div><br><div>diff --git a/include/tst_cgroup.h b/include/ts=
t_cgroup.h</div><div>index bfd848260..0f7db5487 100644</div><div>--- a/incl=
ude/tst_cgroup.h</div><div>+++ b/include/tst_cgroup.h</div><div>@@ -7,8 +7,=
9 @@</div><div>&nbsp;#ifndef TST_CGROUP_H</div><div>&nbsp;#define TST_CGROU=
P_H</div><br><div>-#define PATH_TMP_CG_MEM&nbsp; &nbsp; &nbsp; &nbsp; &quot=
;/tmp/cgroup_mem&quot;</div><div>-#define PATH_TMP_CG_CST&nbsp; &nbsp; &nbs=
p; &nbsp; &quot;/tmp/cgroup_cst&quot;</div><div>+#define PATH_BASE (getenv(=
&quot;TMPDIR&quot;) ? getenv(&quot;TMPDIR&quot;) : &quot;/tmp&quot;)</div><=
div>+#define PATH_TMP_CG_CST (strcat(PATH_BASE, &quot;/cgroup_cst&quot;))</=
div><div>+#define PATH_TMP_CG_MEM (strcat(PATH_BASE, &quot;/cgroup_mem&quot=
;))</div></blockquote><div><br></div><div><div class=3D"gmail_default"><fon=
t style=3D"font-size:small">As described&nbsp;on strcat() manual page, the =
potential risk is that buffer overruns might cause an unpredictable problem=
.</font></div></div><div class=3D"gmail_default"><br></div><div class=3D"gm=
ail_default"><font style=3D"font-size:small">I won't like to merge this pat=
ch because, Richard raised a new method to refactor the whole CGroup API. A=
nd the patchset is pending on reviewing.</font></div><div class=3D"gmail_de=
fault"><br></div><div class=3D"gmail_default"><div><font style=3D"font-size=
:small"><a href=3D"http://lists.linux.it/pipermail/ltp/2020-December/020274=
.html" title=3D"http://lists.linux.it/pipermail/ltp/2020-December/020274.ht=
ml">http://lists.linux.it/pipermail/ltp/2020-December/020274.html</a></font=
></div></div></div><div><br></div><div>--</div><div><div><div><div>Regards,=
</div></div><div><div>Li Wang</div></div></div></div></div></blockquote>=

--5fedaa15_3fd37fd1_1628--


--===============0130754536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0130754536==--

